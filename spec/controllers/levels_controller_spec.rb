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
  end

  context "Show as a action for logged in user" do
    before do
      @user = create(:user)
      sign_in :user, @user
    end

    it 'Should show list of topics of the level' do
      4.times {create(:topic, :level => @level)}
      get :show, :id => @level.id
      assigns(:topics).should be_present
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
        assigns(:level).new_record?.should be_true
    end

    it 'should create new level and bonus round' do
      level = build(:level)
      bonus_round = build(:bonus_round, :level => level)
      level.delete("_id")
      post :create, {:level => level.attributes}
      level = assigns(:level)
      level.persisted?.should be_true
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
      level[:level_number] = 10
      put :update, {:level => level, :id => @level.id}
      level1 = assigns(:level)
      level1.level_number.should eq(10)
    end
  end

  context "Only admin can destroy level" do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 

    it 'Should delete' do
      delete :destroy, id: @level.id
      assigns(@level.id).should be_nil
    end
  end
end
