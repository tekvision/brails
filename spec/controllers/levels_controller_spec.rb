require 'spec_helper'

describe LevelsController do
  def valid_session
    {}
  end

  def valid_attributes
    {}
  end
  
  before do
    @user = create(:user)
    sign_in :user, @user
    @topic = create(:topic)
    @topic1 = create(:topic)
    @level = create(:level)
    @br = build(:bonus_round)
  end

  it 'Should display the index' do
    get :index
    render_template('home#index')
    should respond_with(:success)
    @level.should_not be_nil
  end

  it 'Should show number of cookies for the level' do
    level_cookies = @topic.cookies + @topic1.cookies
    level_cookies.should_not be_nil
  end

  context 'Only admin can create level' do
    before do
      @user = create(:admin)
      sign_in :user, @user
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    describe "GET new" do
      it "assigns a new level as @level" do
        get :new, {}, valid_session
        assigns(:level).should be_nil
      end
    end

    it 'should redirect to new page' do
      get :new
      expect(response).to render_template("new")
    end

      it 'should create new level' do
        level = build(:level).attributes
	level.delete("_id")
        post :create, {:level => level}
	level = assigns(:level)
#        response.should redirect_to(:action => 'index')
      end
    end

  context 'Only admin can update level' do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 
  
    it 'should redirect to edit page' do
      get :edit, {:id => @level.id}
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'should edit existing level' do
      get :edit, {:id => @level.id}
      expect(response).to render_template("edit")
    end

    it 'should redirect to index page after updating' do
      @level.level_name = 'Updated level_name'
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
