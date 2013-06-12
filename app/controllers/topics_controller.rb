class TopicsController < ApplicationController
  before_filter :load_topic, :only => [:edit, :update, :take_test] 

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end
  
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      flash[:message] = 'Successfully created'
      redirect_to topic_url(@topic)
    else
      render :action => :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    if @topic.update_attributes(params[:topic])
      flash[:message] = 'Successfully updated'
      redirect_to topic_url(@topic)
    else
      render :action => :update
    end
  end

  def destroy

  end

  def take_test
    @questions = @topic.questions

  end

  def attempt_question
    @question = Question.find_by(:id => params[:id])
    question_params = params[:question]
    if question_params["option"]["is_valid"] == true && @question.attempt.count == 0
      @question.attempt.solved = true
      @question.attempt.cookies = @question.cookies
      @question.save
    elsif question_params["option"]["is_valid"] == true && @question.attempt.count > 0
      @question.attempt.solved = true
      cookies = @question.cookies / @question.attempt.count
      @question.attempt.cookies = cookies.round
      @question.save
    else
      @question.attempt.count = @question.attempt.count + 1
      @question.save
    end
    render :nothing => true
  end

  private
  def load_topic
    @topic = Topic.find_by(:id => params[:id])
  end


end
