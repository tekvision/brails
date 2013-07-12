class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to "/", :alert => exception.message
  end

  protect_from_forgery
  #TODO: uncomment during development
  before_filter :authenticate_user!

  helper_method :won_topic_coins, :topic_calculate_coins

  def won_topic_coins(topic)
    topic.attempts.where(:user => current_user).collect{|attempt| attempt.coins}.inject(:+) || 0
  end

  def topic_calculate_coins(topic)
    topic.contents.includes(:questions).inject(0) do |count, content|
      count + content.questions.inject(0) do |count, question|
        count + H_COOKIES[question.question_type]
      end
    end
  end

  def after_sign_in_path_for(resource)
    if resource && resource.sign_in_count == 1
      root_path
    else
      levels_path
    end
  end


  protected
  def authenticate_inviter!
   # authenticate_user!(:force => true)
  end

end
