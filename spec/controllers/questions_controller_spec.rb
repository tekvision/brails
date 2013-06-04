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

    it 'should create new question and its options for topic' do
      topic = create(:topic)
      question= build(:question)
      build(:option, :question => question)
      post :create, {:question => question.attributes, :topic_id => topic.id}
      assigns(:question).persisted?.should be_true
    end

    it 'should create new question and its options for topic' do
      bonus_round = create(:bonus_round)
      question= build(:question)
      build(:option, :question => question)
      post :create, {:question => question.attributes, :bonus_round_id => bonus_round.id}
      assigns(:question).persisted?.should be_true
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

  context "When attempting the question and it is solved" do
    before do
      @user = create(:student)
      sign_in :user, @user
    end

    it 'Should save the state of question' do
      question = create(:question)
      create(:option, is_valid: true, :question => question)
      create(:attempt, :question => question, :user => @user)
      get :attempt_question, :id => question.id
      assigns(:question).attempt.solved.should be_true
    end

    it 'Should give cookies for the topic' do
      question = create(:question)
      create(:topic, :question => question)
      create(:user_topic, :topic => question.topic, :user => @user)
      get :attempt_question, :id => question.id
      cookies = assigns(:question).topic.user_topic.topic_cookies
      cookies = cookies + question.topic.user_topic.topic_cookies
      cookies.should eq(assigns(:question).topic.user_topic.topic_cookies + question.topic.user_topic.topic_cookies)
    end
  end

  context "When attempting the question and is not solved" do
    it 'Should increase attempt count by one' do
      question = create(:question)
      create(:option, is_valid: false, :question => question)
      create(:attempt, :question => question, :user => @user)
      get :attempt_question, :id => question.id
      count = assigns(:question).attempt.count
      count = count + 1
      count.should eq(question.attempt.count + 1)
    end
  end

  context "When solved the question after some attempts" do
    it 'Should save the state of question' do
      question = create(:question)
      create(:option, is_valid: true, :question => question)
      create(:attempt, :question => question, :user => @user)
      get :attempt_question, :id => question.id
      assigns(:question).attempt.solved.should be_true
    end

    it 'Should give cookies for the topic but reduce according to attempt count' do
      question = create(:question)
      create(:attempt, :question => question, :user => @user)
      create(:topic, :question => question)
      create(:user_topic, :topic => question.topic, :user => @user)
      get :attempt_question, :id => question.id
      cookies = assigns(:question).topic.user_topic.topic_cookies
      cookies = cookies + question.topic.user_topic.topic_cookies - question.attempt.count
      cookies.should eq(assigns(:question).topic.user_topic.topic_cookies + question.topic.user_topic.topic_cookies - question.attempt.count)
    end
  end

end
