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
      get :show_topics, :id => @level.id
      assigns(:topics).should_not be_nil
      assigns(:topics).each {|topic| topic.level.id.should eq(@level.id)}
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
      get :edit, {:id => @level.id}
      level = assigns(:level)
      level.should_not be_nil
    end

    it 'should update' do
      level = @level.attributes
      put :update, {:level => level, :id => @level.id}
      level1 = assigns(:level)
      level1.should_not be_nil
    end
  end

  context "Only admin can destroy level" do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 

    it 'Should delete' do
      delete :destroy, id: @level.id
      assigns(:level).should be_nil
    end
  end

  context "When level ends" do
    it 'Should un-lock the bonus round' do
      level = @br.level
      level.bonus_round.is_locked.should eq(false)
    end
  end
end
