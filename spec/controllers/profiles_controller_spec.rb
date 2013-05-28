require 'spec_helper'

describe ProfilesController do

  before do
    @user = create(:user)
    sign_in :user, @user
    @profile = create(:profile)
  end

  context 'create profile' do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

     it 'user should create new profile' do
       profile = build(:profile).attributes
       profile.delete("_id")   
       post :create, { :profile => profile} 
       profile = assigns(:profile)
       render_template('profiles#index')
     end
    end

    context 'edit profile' do
        it 'should redirect to edit page' do
	  get :edit, {:id => @profile.id}
          expect(response).to be_success
          expect(response.status).to eq(200)
	end

	it 'should redirect to show page after updating profile' do
	  @profile.first_name = 'Updated first name'
          profile = @profile.attributes
          put :update, {:profile => profile, :id => @profile.id}
          @profile = assigns(:profile)
          render_template('profile#show')	  
	end
    end

    context 'delete profile' do
	it 'should generate alert box'
	it 'should confirm message'
	it 'should have ok and cancel buttons'
	it 'should not delete after clicking cancel button'
	it 'should delete after clicking on ok button'
        it 'should redirects to index page after deleting'
    end
end
