class ApplicationController < ActionController::Base

  protect_from_forgery
  #TODO: uncomment during development
  before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource && resource.sign_in_count == 1
      root_path
    else
      root_path
    end
  end
end
