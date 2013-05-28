require 'spec_helper'

describe QuestionsController do
  def valid_session
    {}
  end

  def valid_attributes
    {  }
  end

  before do
    @question = create(:question)
    end

  it 'Should show questions serially' do
    # There will be a link for each question
    questions = {"1" => @question, "2" => @question}
    questions["1"].should_not be_nil
    question["2"].should_not be_nil
  end

  it 'Should reduce cookies on attempts' do
    question = build(:question)
    question.options << build(:option, :question => question)
    question.options.should false


  end

  it 'Should display the index' do
    get :index
    render_template('questions#index')
    should respond_with(:success)
    @question.should_not be_nil
  end

  context 'Only admin can create level' do
    before do
      @user = create(:admin)
      sign_in :user, @user
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    describe "GET new" do
      it "assigns a new question as @question" do
        get :new, {}, valid_session
        assigns(:question).should be_nil
      end
    end

    it 'should redirect to new page' do
      get :new
      expect(response).to render_template("new")
    end

      it 'should create new question' do
        question = build(:question).attributes
	question.delete("_id")
        post :create, {:question => question}
	question = assigns(:question)
        render_template('questions#index')
      end
    end
>>>>>>> 1b99d4141e1e6de682bca9308d45d2b7534d49ab

  context 'Only admin can update level' do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 
  
    it 'should redirect to edit page' do
      get :edit, {:id => @question.id}
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'should edit existing question' do
      get :edit, {:id => @question.id}
      expect(response).to render_template("edit")
    end

    it 'should redirect to index page after updating' do
      @question.query = 'Updated query'
      question = @question.attributes
      put :update, {:question => question, :id => @question.id}
      @question1 = assigns(:question)
    end

    it "assigns the requested question as @question" do
      question = Question.create! valid_attributes
      get :edit, {:id => question.to_param}, valid_session
      assigns(:question).should be_nil
    end
  end

  context "Only admin can destroy level" do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 

    it 'Should delete' do
      delete :destroy, id: @question.id
    end
  end
end
