class ProfilesController < ApplicationController

def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @leave }
    end#do
  end#show


end#class


