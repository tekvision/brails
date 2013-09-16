class UserMailer < ActionMailer::Base

  def nominateReport(nominate, user)
    @nominate = nominate
    @user = user
    mail(:from => "abrails7@gmail.com", :to => @user, :subject => "Nomination request", :template_path => "user_mailer", :template_name => "nomination")
  end

  def feedbackReport(feedback, user)
    @feedback = feedback
    mail(:from => @feedback.email, :to => user, :subject => "Feedback", :template_path => "user_mailer", :template_name => "feedback_report")
  end
end
