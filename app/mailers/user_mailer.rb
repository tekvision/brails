class UserMailer < ActionMailer::Base

  def nominateReport(nominate, user)
    @nominate = nominate
    @user = user
    mail(:from => "abrails7@gmail.com", :to => @user, :subject => "Nomination request", :template_path => "user_mailer", :template_name => "nomination")
  end
end
