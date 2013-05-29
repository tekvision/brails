require 'spec_helper'

describe QuestionsController do
  def valid_session
    {}
  end

  def valid_attributes
    {}
  end

  describe "GET index action for logged in user" do
    before do
      @user = create(:user)
      sign_in :user, @user
      get :index
    end

    it 'Should show questions serially' do
      # There will be a link for each question
      questions = {"1" => :question, "2" => :question}
      questions["1".to_i].should_not be_nil
      questions["2".to_i].should_not be_nil
      assigns(:question).should_not be_nil
    end

    it 'Should display the questions' do
      get :index      
      assigns(:question).should_not be_nil
    end
  end

  it 'Should reduce cookies on attempts' do
    question = build(:question)
    question.options << build(:option, :question => question)
    question.options[0].is_valid.should be_false
    question.attempts_count.should eq(1) # Will increase by 1 on each invalid attempt
    cookies = question.cookies_count - question.attempts_count
    cookies.should be < question.cookies_count
  end

  context 'Only admin can create question' do
    before do
      @user = create(:admin)
      sign_in :user, @user
      get :new
      post :create
    end

    it "Should assigns a new question as @question" do
      get :new
      should render_template(:new) 
      assigns(:question).should_not be_nil
    end

    it "The save is successful" do
     question = assigns(:question).should_not be_nil
      post :create, {:question => question}
      response.should redirect_to(:action => 'show', :id => question.id)
      flash[:notice].should ==  I18n.t('question.created')
    end

    it "The save fails" do
      question = assigns(:question).should be_nil
      post :create, {:question => question}
      should render_template(:new) 
      assigns(:question).should_not be_nil
    end
  end

  context 'Only admin can update question' do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
      get :edit
      put :update
    end 
  
    it 'should redirect to edit page' do
      get :edit, {:id => @question.id}
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'should edit existing question' do
      get :edit, {:id => :question.id}
      expect(response).to render_template("edit")
    end

    it 'should redirect to index page after updating' do
      @question.query = 'Updated query'
      question = @question.attributes
      put :update, {:question => question, :id => @question.id}
      @question1 = assigns(:question)
    end

    it "assigns the requested question as @question" do
      question = assigns(:question)
      get :edit, {:id => question.to_param}
      assigns(:question).should_not be_nil
    end
  end

  context "Only admin can destroy question" do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 

    it 'Should delete' do
      delete :destroy, id: @question.id
    end
  end
end
