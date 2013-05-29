require 'spec_helper'

describe LevelsController do
  before do
@level = create(:level)
  end

  context "GET index action for logged in user" do
    before do
      @user = create(:user)
      sign_in :user, @user
    end

    it 'Should display the levels' do
      get :index
      assigns(:levels).should_not be_nil
    end

    it 'Should show number of cookies for each level' do
      level = create(:level)
      4.times {create(:topic, :level => level)}
      cookies = 0
      level.topics.each {|topic| cookies = cookies + topic.cookies}
      level_cookies = {level.id => cookies}
      get :index
      assigns(:level_cookies).should eq(level_cookies)
    end
  end

  context "When clicking on level" do
    it 'Should show list of topics' do
      assigns(:levels).topics.should_not be_nil
    end
  end

  context 'Only admin can create level' do
    before do
      @user = create(:admin)
      sign_in :user, @user
    end

    it "assigns a new level as @level" do
        get :new
        assigns(:level).id.should_not be_nil
      expect(response).to render_template("new")
    end

    it 'should create new level' do
      level = build(:level).attributes
      level.delete("_id")
      post :create, {:level => level}
      level = assigns(:level)
      level.should_not be_nil
    end
  end

  context "Only admin can edit or update level" do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 
  
    it 'should edit as an action' do
      level = assigns(:level)
      get :edit, {:id => level.id}
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'should update' do
      level = @level.attributes
      put :update, {:level => level, :id => @level.id}
      @level1 = assigns(:level)
    end

    it "assigns the requested level as @level" do
      level = Level.create! valid_attributes
      get :edit, {:id => level.to_param}, valid_session
      assigns(:level).should be_nil
    end
  end

  context "Only admin can destroy level" do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 

    it 'Should delete' do
      delete :destroy, id: @level.id
    end
  end

  context "When clicking on the level" do
    it 'Should show list of topics' do
      @topic.title.should_not be_nil
      @topic1.title.should_not be_nil
    end
  end

  context "When the level ends" do
    it 'Should finished all the topics of the level' do
      topics = [@topic, @topic1]
      topics.size.should eq(2)
    end

    it 'Should un-lock the bonus round' do
      level = @br.level
      level.bonus_round.is_locked.should eq(false)
    end
  end
end
