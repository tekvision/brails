class UsersController < ApplicationController
  before_filter :authenticate_inviter!
def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @users }
    end
  end
end
