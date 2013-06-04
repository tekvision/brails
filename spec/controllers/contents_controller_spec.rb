require 'spec_helper'

describe ContentsController do
  it 'Should render content sequentially' 

  context "When rendering the content" do
    it 'Should render text if type is text'
    it 'Should play an audio file if type is audio'
    it 'Should play video if type is video'
    it 'Should show an image if type is image'
    it 'Should render questions when requested'
  end

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
      content = build(:content).attributes
      content.delete('_id')
      post :create, {:content => content}
      assigns(:content).title.should eq(content.title)
      response.should redirect_to(:action => 'show', :id => assigns(:content).id)
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
