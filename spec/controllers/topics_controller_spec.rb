require 'spec_helper'

describe TopicsController do
  describe "GET show a topic" do
    before do
      @topic = create(:topic)
      get :show, id: @topic.id
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

    it 'Should show summary' do
      assigns(:topic).summary.should_not eq('')
    end
  end

  context "GET take_test action is invoked" do
    before do
      @topic = create(:topic)
      4.times {create(:question, :topic => @topic)}
      @topic.questions.each {|question| 4.times {create(:option, :question => question)}}
      get :take_test, @topic.id
    end

    it 'should show the questions of the topic' do
      assigns(:questions).should eq(@topic.questions)
    end

    it 'each question should have multiple options' do
      assigns(:questions)[0].options.size.should eq(@topic.questions[0].options.size)
    end
  end

  context 'GET new topic action' do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      assigns(:topic).should_not be_nil
    end
  end

  context 'POST create new topic' do
    it 'should create new topic' do
      topic = build(:topic).attributes
      topic.delete('_id')
      post :create, {:topic => topic}
      assigns(:topic).title.should eq(topic.title)
      response.should redirect_to(:action => 'show', :id => assigns(:topic).id)
    end
  end
	
  context 'edit topic' do
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

  context 'When clicking on delete topic' do
    it 'Should delete' do
      post :destroy, id: @topic.id
      assigns(:topic).should be_nil
    end
  end

end
