class PartsController < ApplicationController

  def index
    @parts = Part.all
  end

  def show
    @part = Part.find(params[:id])
  end

  def new
    @part = Part.new
  end

  def edit
    @part = Part.find(params[:id])
  end

  def create
    @part = Part.new(params[:part])
    respond_to do |format|
      if @part.save
        format.html { redirect_to @part, notice: 'Part was successfully created.' }
        format.json { render json: @part, status: :created, location: @part }
      else
        format.html { render action: "new" }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @part = Part.find(params[:id])
    respond_to do |format|
      if @part.update_attributes(params[:part])
        format.html { redirect_to @part, notice: 'Part was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    respond_to do |format|
      format.html { redirect_to parts_url }
      format.json { head :no_content }
    end
  end
end
