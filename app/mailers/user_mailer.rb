class UserMailer < ActionMailer::Base

  def welcome_email(user, url)
    @user = user
    @url  = url
    mail to: @user.email, subject: 'Welcome to My Awesome Site', from: 'roman18888@gmail.com'
  end
end
