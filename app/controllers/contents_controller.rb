class ContentsController < ApplicationController
  before_filter :load_content, :only => [:edit, :update] 

  def index
    @contents = Content.all
  end

  def new
   @content = Content.new
   @topics = Topic.all   
  end

  def create
    @content = Content.new(params[:content])
    if @content.save
      flash[:message] = 'Successfully created'
      redirect_to content_url(@content)
    else
      redirect_to new_content_url(@content)
    end
  end

  def edit
  end

  def update
    if @content.update_attributes(params[:content])
      flash[:message] = 'Successfully created'
      redirect_to content_url(@content)
    else
      redirect_to new_content_url(@content)
    end
  end

  def load_content
    @content = Content.find_by(:id => params[:id])
  end

  def destroy

  end

end
