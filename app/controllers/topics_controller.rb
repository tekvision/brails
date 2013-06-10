class TopicsController < ApplicationController
  before_filter :load_topic, :only => [:edit, :update] 

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
  end

  def update
    if @topic.update_attributes(params[:topic])
      flash[:message] = 'Successfully created'
      redirect_to topic_url(@topic)
    else
      render :action => :update
    end
  end

  def load_topic
    @topic = Topic.find_by(:id => params[:id])
  end

  def destroy

  end

end
