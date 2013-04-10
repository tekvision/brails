class ChaptersController < ApplicationController

  def index
    @chapters = Chapter.all
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def new
    @chapter = Chapter.new
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def create
    @chapter = Chapter.new(params[:chapter])
    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter, notice: 'Chapter was successfully created.' }
        format.json { render json: @chapter, status: :created, location: @chapter }
      else
        format.html { render action: "new" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @chapter = Chapter.find(params[:id])
    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end
end
