class UserMailer < ActionMailer::Base
  def account_confirmation_mailer(user, url)
    @user = user
    @url  = url
    mail to: @user.email, subject: 'Welcome to My Awesome Site', from: 'admin@gmail.com'
  end
end