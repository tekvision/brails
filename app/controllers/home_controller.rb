class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

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
        render action: "new"
      end
    end
  end
end
 