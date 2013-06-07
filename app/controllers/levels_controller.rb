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
  end

  def update
  end

  def destroy
  end
end
