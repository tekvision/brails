if Rails.env.development?
  ActionMailer::Base.smtp_settings = {
    :address => "localhost",
    :port => 1025,
    :domain => "joshintranet.com"
  }
end
