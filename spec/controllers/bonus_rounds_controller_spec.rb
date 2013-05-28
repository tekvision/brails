require 'spec_helper'

describe BonusRoundsController do
  def valid_session
    {}
  end

  def valid_attributes
    {}
  end

  before do
    @user = create(:user)
    sign_in :user, @user
    @bonus_round = create(:bonus_round)
  end

  it 'Should display the index' do
    get :index
    render_template('bonus_rounds#index')
    should respond_with(:success)
    @bonus_round.should_not be_nil
  end

  context 'Only admin can create bonus_round' do
    before do
      @user = create(:admin)
      sign_in :user, @user
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

      it "assigns a new bonus_round as @bonus_round" do
        get :new, {}, valid_session
        assigns(:bonus_round).should be_nil
      end

    it 'should redirect to new page' do
      get :new
      expect(response).to render_template("new")
    end

      it 'should create new bonus_round' do
        bonus_round = build(:bonus_round).attributes
	bonus_round.delete("_id")
        post :create, {:bonus_round => bonus_round}
	bonus_round = assigns(:bonus_round)
        render_template('bonus_rounds#index')
      end
    end

  context 'Only admin can update bonus_round' do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 
  
    it 'should redirect to edit page' do
      get :edit, {:id => @bonus_round.id}
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'should edit existing bonus_round' do
      get :edit, {:id => @bonus_round.id}
      expect(response).to render_template("edit")
    end

    it 'should redirect to index page after updating' do
      @bonus_round.extra_cookies = 'Updated extra_cookies'
      bonus_round = @bonus_round.attributes
      put :update, {:bonus_round => bonus_round, :id => @bonus_round.id}
      @bonus_round = assigns(:bonus_round)
      render_template('bonus_rounds#index')
    end

    it "assigns the requested level as @bonus_round" do
      bonus_round = BonusRound.create! valid_attributes
      get :edit, {:id => bonus_round.to_param}, valid_session
      assigns(:bonus_round).should be_nil
    end
  end

  context "Only admin can destroy bonus_round" do
    before(:each) do
      @user = create(:admin)
      sign_in :user, @user
    end 

    it 'Should delete' do
      delete :destroy, id: @bonus_round.id
    end
  end
end
