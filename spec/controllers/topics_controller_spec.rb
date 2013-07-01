require 'spec_helper'

describe TopicsController do
  describe "GET show a topic" do
    before(:each) do
      @topic = create(:topic)
      @level = create(:level)
      get :show, level_id: @level.id, id: @topic.id
    end 

    it 'Should show the topic' do
      assigns(:topic).should be_valid
    end

    it 'should be published' do
      assigns(:topic).published.should be_true
    end 

    it 'Should have associated content' do
      assigns(:topic).contents.size.should > 0
    end
  end

  context "GET take_test action is invoked" do
    before do
      @topic = create(:topic)
      4.times {create(:question, :topic => @topic)}
      @topic.questions.each {|question| 4.times {create(:option, :question => question)}}
      get :take_test, :id => @topic.id
    end

    it 'should show the questions of the topic' do
      assigns(:questions).should eq(@topic.questions)
    end

    it 'each question should have multiple options' do
      assigns(:questions)[0].options.size.should eq(@topic.questions[0].options.size)
    end
  end

  context 'Only admin can create the topic' do
    before do
      @user = create(:admin)
      sign_in :user, @user
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      assigns(:topic).should_not be_nil
    end

    it 'should create new topic' do
      topic = build(:topic)
      post :create, {:topic => topic.attributes.except('_id')}
      assigns(:topic).title.should eq(topic.title)
      assigns(:topic).content.should eq(topic.content)
      assigns(:topic).question.should eq(question)
    end
  end
	
  context 'Only admin can Edit or Update topic' do
    before(:each) do
      @topic = create(:topic)
    end
    
    it 'should be valid' do
      get :edit, {:id => @topic.id}
      expect(response).to be_success
      assigns(:topic).should eq(@topic)
    end

    it 'should update the topic' do
      @topic.title = 'Updated Title'
      topic = @topic.attributes
      post :update, {:topic => topic, :id => @topic.id}
            assigns(:topic).title.should eq('Updated Title')
      response.should redirect_to(:action => 'show', :id => assigns(:topic).id)
    end
  end

  context "Only admin can delete topic" do
    before do
      @user = create(:admin)
      sign_in :user, @user
    end
    
    it 'Should delete' do
      @topic = create(:topic)
      expect{
        delete :destroy, id: @topic
      }.to change(Topic,:count).by(-1)
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
      question1 = question.attributes
      question1[:option] = question.options[0].attributes
      xhr :get, :attempt_question, :id => question.id, :question => question1
      assigns(:question).attempt.solved.should be_true
    end

    it 'Should give cookies for the topic' do
      question = create(:question)
      questions = [question]
      create(:topic, :questions => questions)
      create(:option, is_valid: true, :question => question)
      create(:attempt, :question => question, :user => @user)
      question1 = question.attributes
      question1[:option] = question.options[0].attributes
      xhr :get, :attempt_question, :id => question.id, :question => question1
      assigns(:question).attempt.cookies.should  eq(question.cookies)
    end
  end

  context "When attempting the question and is not solved" do
    it 'Should increase attempt count by one' do
      question = create(:question)
      questions = [question]
      create(:topic, :questions => questions)
      create(:option, is_valid: false, :question => question)
      create(:attempt, :question => question, :user => @user)
      question1 = question.attributes
      question1[:option] = question.options[0].attributes
      xhr :get, :attempt_question, :id => question.id, :question => question1
      count = assigns(:question).attempt.count
      count.should eq(question.attempt.count + 1)
    end
  end

  context "When solved the question after some attempts" do
    before(:each) do
      @user = create(:student)
			p @user.errors
      sign_in :user, @user
			@user.reload
			p @user
    end

    it 'Should save the state of question' do
      question = create(:question)
      questions = [question]
      create(:topic, :questions => questions)
      create(:option, is_valid: true, :question => question)
      create(:attempt, :question => question, :user => @user)
      question1 = question.attributes
      question1[:option] = question.options[0].attributes
      xhr :get, :attempt_question, :id => question.id, :question => question1
      assigns(:question).attempt.solved.should be_true
    end

    it 'Should give cookies for the topic but reduce according to attempt count' do
      question = create(:question)
			p question
      questions = [question]
      create(:topic, :questions => questions)
      create(:option, is_valid: true, :question => question)
      create(:attempt, :count => 1, :question => question, :user => @user)
      question1 = question.attributes
      question1[:option] = question.options[0].attributes
      xhr :get, :attempt_question, :id => question.id, :question => question1
      cookies = assigns(:attempt).cookies
      cookies.should eq(H_COOKIES[question.question_type] / question.attempt.count.round)
    end
  end

end
