require 'spec_helper'

describe UsersController do
  context "user can create or edit profile" do
    before do
      @user = create(:user)
      sign_in :user, @user
    end 

    it "should GET edit action" do
      get :edit, {:id => @user.id} 
      user = assigns(:user)
      user.should_not be_nil
    end
  end
end 
