require 'spec_helper'

describe TopicsController do
  before(:each) do
      @user = create(:user)
      sign_in @user
  end
  
  describe "GET show a topic" do
    before(:each) do
      @level = create(:level)
      @topic = create(:topic)
      3.times {create(:content, :topic => @topic)}
    end 

    it 'Should show list of contents of the topic' do
      get :show, :level_id => @level.id, :id => @topic.id
      assigns(:contents).each {|content| content.topic_id.should be_present}
    end

    it 'should be published' 

    it 'Should have associated content' do
      get :show, :level_id => @level.id, :id => @topic.id
      assigns(:topic).contents.size.should > 0
    end
  end

  context 'Only admin can create the topic' do
    before do
      @level = create(:level)
      @user = create(:admin)
      sign_in :user, @user
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new, level_id: @level.id
      expect(response).to be_success
      assigns(:topic).should_not be_nil
    end

    it 'should create new topic' do
      topic = build(:topic, :level => @level )
      content = build(:content, :topic => topic )
      question = build(:question, :topic => topic)
      post :create, {:topic => topic.attributes, :level_id => @level.id}
      topic = assigns(:topic)
      topic.persisted?.should be_true
    end
  end
	
  context 'Only admin can Edit or Update topic' do
    before(:each) do
      @topic = create(:topic)
      @level = create(:level)
      @user = create(:admin)
      sign_in :user, @user
    end
    
    it 'should be valid' do
      get :edit, {:level_id => @level.id, :id => @topic.id}
      expect(response).to be_success
      assigns(:topic).should eq(@topic)
    end

    it 'should update the topic' do
      @topic.title = 'Updated Title'
      topic = @topic.attributes
      post :update, {:topic => topic, :level_id => @level.id, :id => @topic.id}
      assigns(:topic).title.should eq('Updated Title')
    end
  end

  context "Only admin can delete topic" do
    before do
      @user = create(:admin)
      sign_in :user, @user
    end
    
    it 'Should delete' do
      @topic = create(:topic)
      @level = create(:level)
      expect{
        delete :destroy, level_id: @level.id, id: @topic
      }.to change(Topic,:count).by(-1)
    end
  end

  context "When attempting the question and it is solved" do

    it 'Should save the state of question' do
      question = create(:question)
      @option = create(:option, is_valid: true, :question => question)
      create(:attempt, :question => question, :user => @user)
      question1 = question.attributes
      question1["options"] = question.options[0]
      xhr :get, :attempt_question, :question_id => question.id, :question => question1
      assigns(:attempt).solved.should be_true
    end

    it 'Should give cookies for the topic' do
      question = create(:question)
      @option = create(:option, is_valid: true, :question => question)
      create(:attempt, :question => question, :user => @user)
      question1 = question.attributes
      question1["options"] = question.options[0]
      xhr :get, :attempt_question, :question_id => question.id, :question => question1
      assigns(:attempt).cookies.should  eq(H_COOKIES[question1["question_type"]])
    end
  end

  context "When attempting the question and is not solved" do
    it 'Should increase attempt count by one' do
      question = create(:question)
      @option = create(:correct, :question => question)
      create(:attempt, :question => question, :user => @user)
      question1 = question.attributes
      question1["options"] = question.options[0]
      xhr :get, :attempt_question, :question_id => question.id, :question => question1
      count = assigns(:attempt).count
      question.reload
      count.should eq(question.attempts.first.count)
    end
  end

  context "When solved the question after some attempts" do

    it 'Should save the state of question' do
      question = create(:question)
      @option = create(:option, is_valid: true, :question => question)
      create(:attempt, :question => question, :user => @user)
      question1 = question.attributes
      question1["options"] = question.options[0]
      xhr :get, :attempt_question, :question_id => question.id, :question => question1
      assigns(:attempt).solved.should be_true
    end

    it 'Should give cookies for the topic but reduce according to attempt count' do
      question = create(:question)
      @option = create(:option, is_valid: true, :question => question)
      attempt = create(:attempt, :count => 1, :question => question, :user => @user)
      question1 = question.attributes
      question1["options"] = question.options[0]
      xhr :get, :attempt_question, :question_id => question.id, :question => question1
      cookies = assigns(:attempt).cookies
      cookies.should eq(H_COOKIES[question.question_type] / attempt.count.round)
    end
  end

end
