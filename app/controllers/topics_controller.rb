class TopicsController < ApplicationController
  before_filter :load_topic, :only => [:edit, :update, :take_test, :destroy, :show] 
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

  def take_test
    @questions = @topic.questions
  end

  def attempt_question
    @question = Question.find(params[:question_id])
    @answer = @question.options.where(:_id => params["question"]['options']).try(:first) if params['question'].present?
    @attempt = Attempt.where(:user => current_user, :question => @question, :topic => @question.topic).first
    @attempt = Attempt.create(:user => current_user, :question => @question, :topic => @question.topic) if @attempt.nil? 
    @attempt.save
    if @answer.is_valid and @attempt.count == 0
      @attempt.update_attributes({solved: true, cookies: H_COOKIES[@question.question_type]})
    elsif @answer.is_valid and @attempt.count > 0
      cookies = (H_COOKIES[@question.question_type] / @attempt.count ).round
      @attempt.update_attributes({solved: true, cookies: cookies})
    else
      @attempt.update_attributes({count: @attempt.count + 1})
    end
  end

  def destroy
    @topic.destroy
  end

  private
  def load_topic
    @topic = Topic.find(params[:id])
    @level = Level.find(params[:level_id])
  end

end
