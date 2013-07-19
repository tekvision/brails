class LevelsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource :level, :except => [:index, :show]
 

  def index
    @levels = Level.all.order_by("level_number ASC")
  end

  def levels_list
    @levels = Level.all.order_by("level_number ASC")
  end

  def show
    @count = 0
    @level = Level.find(params[:id])
  end

  def new
    @level = Level.new
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

  def attempt_bonus_question
    @question = Question.find(params[:question_id])
    @answer = @question.options.where(:_id => params["question"]['options']).try(:first) if params['question'].present?
    @attempt = Attempt.find_or_create_by(:user => current_user, :question => @question)
    if @answer.is_valid and @attempt.increase_count == 0
      @attempt.update_attributes({solved: true, coins: H_COOKIES[@question.question_type]})
    elsif @answer.is_valid and @attempt.increase_count > 0
      coins = (H_COOKIES[@question.question_type] / @attempt.increase_count ).round
      @attempt.update_attributes({solved: true, coins: coins})
    else
      @attempt.inc(:increase_count, 1)
    end
  end

  def calculate_coins(level_id)
    @level = Level.find_by(:id => level_id)
    @level.topics.includes(:contents).inject(0) do |count, topic|
      count + topic.contents.inject(0) do |count, content|
        count + content.questions.inject(0) do |count, question|
          return count + H_COOKIES[question.question_type]
	      end
      end
    end
  end
end
