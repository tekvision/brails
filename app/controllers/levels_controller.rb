class LevelsController < ApplicationController
#  load_and_authorize_resource
  def index
    @levels = Level.all
  end

  def show
    @level = Level.find(params[:id])
  end

  def new
    @level = Level.new
    @level.build_bonus_round
  end

  def create		
    @level = Level.new(params[:level])
    respond_to do |format|
      if @level.save
        format.html { redirect_to levels_path, notice: 'level created successfully.' }
        format.json { render json: @level, status: :created, location: @level }
      else
        format.html { render action: "new"}
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @level = Level.find(params[:id])
  end

  def update
    @level = Level.find(params[:id])
    respond_to do |format|
      if @level.update_attributes(params[:level])
        format.html { redirect_to levels_path, notice: 'level was successfully updated.' }
        format.json { render json: @level, status: :updated, location: @level }
      else
        format.html { render action: "edit"}
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @level = Level.find(params[:id])
    @level.destroy
    respond_to do |format|
      format.html { redirect_to levels_url, notice: "Level was deleted successfully."}
      format.json { head :no_content }
    end
  end
end
