class LevelsController < ApplicationController
  load_and_authorize_resource

  def index
    @levels = Level.all
  end

  def levels_list
    @levels = Level.all
  end

  def show
    @level = Level.find(params[:id])
    @level_cookies = calculate_cookies(@level.id)
    @topics = @level.topics
  end

  def new
    @level = Level.new
    @level.build_bonus_round
  end

  def create		
    @level = Level.new(params[:level])
    respond_to do |format|
      if @level.save
        format.html { redirect_to levels_list_path, notice: 'level created successfully.' }
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
        format.html { redirect_to levels_list_path, notice: 'level was successfully updated.' }
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
      format.html { redirect_to levels_list_path, notice: "Level was deleted successfully."}
      format.json { head :no_content }
    end
  end

  def calculate_cookies(level_id)
    level = Level.find_by(:id => level_id)    
    level_cookies = 0
    topics = level.topics
    topics.each do |topic|
      questions = topic.questions
      topic_cookies = 0
      questions.each do |question|
        topic_cookies = topic_cookies + H_COOKIES[question.question_type]
      end
      level_cookies = level_cookies + topic_cookies          
    end
    return level_cookies
  end
end
