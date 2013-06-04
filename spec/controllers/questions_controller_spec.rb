require 'spec_helper'

describe QuestionsController do
  describe "GET index action for admin" do
    before do
      @user = create(:admin)
      sign_in :user, @user
      @question = create(:question)
    end

    it 'Should display the questions' do
      get :index      
      assigns(:questions).should_not be_nil
    end
  end

  context 'Only admin can create question' do
    before do
      @user = create(:admin)
      sign_in :user, @user
    end

    it "assigns a new question as @question" do
        get :new
        assigns(:question).new_record?.should be_true
    end

    it 'should create new question and its options' do
      question= build(:question)
      build(:option, :question => question)
      post :create, {:question => question.attributes}
      assigns(:question).should be_persisted
    end
  end

  context "Only admin can edit or update question" do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 
  
    it 'should edit as an action' do
      get :edit, {:id => @question.id}
      question = assigns(:question)
      question.should_not be_nil
    end

    it 'should update' do
      question = @question.attributes
      question.query = "What is array?"
      put :update, {:question => question, :id => @question.id}
      assigns(:question).query.should eq("What is array?")
    end
  end

  context "Only admin can destroy level" do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 

    it 'Should delete' do
      delete :destroy, id: @question.id
      assigns(:question).should be_nil
    end
  end


end
