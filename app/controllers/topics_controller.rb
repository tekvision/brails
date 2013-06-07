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
  		redirect_to new_topic_url(@topic)
  	end
  end

  def edit
  end

  def update
  	if @topic.update_attributes(params[:topic])
  		flash[:message] = 'Successfully created'
  		redirect_to topic_url(@topic)
  	else
  		redirect_to new_topic_url(@topic)
  	end
  end

  def load_topic
  	@topic = Topic.find_by(:id => params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    @topic = nil
  end

end
