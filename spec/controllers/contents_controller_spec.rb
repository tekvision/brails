require 'spec_helper'

describe ContentsController do

  context 'GET new content action' do
    before do
      @user = create(:admin)
      sign_in :user, @user
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      assigns(:content).should_not be_nil
    end
  end

  context 'POST create new content' do
    before do
      @user = create(:admin)
      sign_in :user, @user
    end

    it 'should create new content' do      
      topic = create(:topic)
      content = build(:content).attributes
      post :create, {:content => content, :topic_id => topic.id}
      assigns(:content).persisted?.should be_true
      response.should redirect_to(:action => 'show', :id => assigns(:content).id)
    end

    it "should upload audio file and create content" do
      topic = create(:topic)
      content = build(:audio_file).attributes
      post :create, {:audio_file => content, :topic_id => topic.id}
      assigns(:audio_file).persisted?.should be_true
      response.should redirect_to(:action => 'show', :id => assigns(:audio_file).id)
    end

    it "should upload vidio file and create content" do
      topic = create(:topic)
      content = build(:vidio_file).attributes
      post :create, {:vidio_file => content, :topic_id => topic.id}
      assigns(:vidio_file).persisted?.should be_true
      response.should redirect_to(:action => 'show', :id => assigns(:vidio_file).id)
    end

  end

  context 'edit content' do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
      @content = create(:content)
    end
    
    it 'should be valid' do
      get :edit, {:id => @content.id}
      expect(response).to be_success
      assigns(:content).should eq(@content)
    end

    it 'should update the content' do
      @content.title = 'Updated Title'
      content = @content.attributes
      post :update, {:content => content, :id => @content.id}      
      assigns(:content).title.should eq('Updated Title')
      response.should redirect_to(:action => 'show', :id => assigns(:content).id)
    end
  end

  context 'When clicking on delete content' do
    before do
      @user = create(:admin)
      sign_in :user, @user
      @content = create(:content)
    end
    
    it 'Should delete' do
      delete :destroy, id: @content.id
      assigns(:content).should be_nil
    end
  end
end
