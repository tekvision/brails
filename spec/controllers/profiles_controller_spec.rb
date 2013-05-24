require 'spec_helper'

describe ProfilesController do

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
       profile = build(:profile)
#       post :create 
    profile.delete{"_id"}   
    p profile

     end

#       it 'should redirect to index page after creating profile'
    end

    context 'edit profile' do
        it 'should redirect to edit page'
	it 'should edit profile'
	it 'should redirect to index page after updating profile'
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
