class HomeController < ApplicationController

  def section

  end

  def nominate_list
    @nominates = Nominate.all    
  end

  def nominate
    @nominate = Nominate.new
    if request.post?
      @nominate = Nominate.new(params[:nominate])
      if @nominate.save
        user = User.where(:roles => 'Admin').collect(&:email)
	UserMailer.nominateReport(@nominate, user).deliver
	redirect_to root_url, notice: 'User was nominate successfully..'
      else
        render action: "nominate"
      end
    end
  end

  def feedback
    @feedback = Feedback.new
    if request.post?
      @feedback = Feedback.new(params[:feedback])
      if @feedback.save
        user = User.where(:roles => "Admin").collect(&:email)
        UserMailer.feedbackReport(@feedback, user).deliver
        redirect_to root_path  
        
      else
        render action: "feedback"
      end
    end
  end
end
 
