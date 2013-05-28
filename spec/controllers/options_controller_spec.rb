require 'spec_helper'

describe OptionsController do
  def valid_session
    {}
  end

  def valid_attributes
    {}
  end

  before do
    @option = create(:option)
  end

  context 'Only admin can create option' do
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
      it "assigns a new option as @option" do
        get :new, {}, valid_session
        assigns(:option).should be_nil
      end
    end

    it 'should redirect to new page' do
      get :new
      expect(response).to render_template("new")
    end

      it 'should create new option' do
        option = build(:option).attributes
	option.delete("_id")
        post :create, {:option => option}
	option = assigns(:option)
        render_template('options#index')
      end
    end


end
