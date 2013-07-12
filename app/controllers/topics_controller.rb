class TopicsController < ApplicationController
  before_filter :load_topic, :only => [:edit, :update, :destroy, :show] 
  load_and_authorize_resource

  def index
    @level = Level.find(params[:level_id])
    @topics = @level.topics
  end

  def show
    @contents = @topic.contents
  end

  def new
    @level = Level.find(params[:level_id])
    @topic = @level.topics.build
    @topic.contents.build
    question = @topic.questions.build
    question.options.build
    render layout: 'admin'
  end

  def create
    @topic = Topic.new(params[:topic])
    @level = Level.find(params[:level_id])
    if @topic.save
      flash[:message] = 'Successfully created'
      redirect_to level_topics_path(@level)
    else
      render :action => :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    render layout: 'admin'
  end

  def update
    if @topic.update_attributes(params[:topic])
      flash[:message] = 'Successfully updated'
      redirect_to level_topics_path(@level)
    else
      render :action => :edit
    end
  end

  def attempt_question
    @question = Question.find(params[:question_id])
    @answer = @question.options.where(:_id => params["question"]['options']).try(:first) if params['question'].present?
    @attempt = Attempt.find_or_create_by(:user => current_user, :question => @question, :topic => @question.content.topic)
    p @attempt
    if @answer.is_valid and @attempt.increase_count == 0
      @attempt.update_attributes({solved: true, coins: H_COOKIES[@question.question_type]})
    elsif @answer.is_valid and @attempt.increase_count > 0
      coins = (H_COOKIES[@question.question_type] / @attempt.increase_count ).round
      @attempt.update_attributes({solved: true, coins: coins})
    else
      @attempt.inc(:increase_count, 1)
    end
  end

  def destroy
    @topic.destroy
    redirect_to level_topics_path(@level)
  end

  private
  def load_topic
    @topic = Topic.find(params[:id])
    if params[:level_id] != nil
      @level = Level.find(params[:level_id])
    end
  end

end
