require 'spec_helper'

describe TopicsController do
  before do
    @topic = create(:topic)
  end

  it 'Should show the topic' do
    get :show, id: @topic.id
    respond_with(:success)
    @topic.should_not be_nil
  end

  it 'Should render associated content' do
    pending
  end

  it 'Should show summary' do
    @topic.summary.should_not be_nil
  end

  context "When topic ends" do
    it 'Should show an exercise'
  end

  context 'create topic' do

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'should redirect to new page' do
      get :new
      expect(response).to render_template("new")
    end

    it 'should create new topic' do
      topic = build(:topic).attributes
      topic.delete('_id')
      post :create, {:topic => topic}
      topic = assigns(:topic)
      response.should redirect_to(:action => 'show', :id => topic.id)
    end

  end

  context 'edit topic' do

    before(:each) do
      @topic = create(:topic)
    end
    
    it 'should redirect to edit page' do
      get :edit, {:id => @topic.id}
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'should edit existing topic' do
      get :edit, {:id => @topic.id}
      expect(response).to render_template("edit")
    end

    it 'should redirect to index page after updating' do
      @topic.title = 'Updated Title'
      topic = @topic.attributes
      post :update, {:topic => topic, :id => @topic.id}
      @topic1 = assigns(:topic)
      @topic1.title.should eq('Updated Title')
      response.should redirect_to(:action => 'show', :id => @topic1.id)
    end

  end

  context 'delete topic' do
    it 'should generate alert box'
    it 'should confirm message'
    it 'should have ok and cancel buttons'
    it 'should not delete after clicking cancel button'
    it 'should delete after clicking on ok button'
    it 'should redirects to index page after deleting'
  end
end
