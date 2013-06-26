class UsersController < ApplicationController
  before_filter :authenticate_inviter!
  load_and_authorize_resource

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @users }
    end
  end

  def edit
    @user = User.find(params[:id])
    @user.build_profile if @user.profile.nil?
  end
  
  def profile
    @user = current_user
    if request.post?
      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to levels_path, notice: 'Profile was successfully updated!'  }
        else
          format.html { render action: "edit" }
	  format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end
