class ProfilesController < ApplicationController
def index
    @profiles = Profile.all
    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @profiles }
    end
  end

  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @profile }
    end
  end

  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @profile }
    end
  end
  def edit
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profiles_path, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @batch.update_attributes(params[:profile])
        format.html { redirect_to profiles_path, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
end#class


