class UserMailer < ActionMailer::Base

  default from: "from@example.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

  def account_confirmation_mailer(user, url)
    @user = user
    @url  = url
    mail to: @user.email, subject: 'Welcome to My Awesome Site', from: 'admin@gmail.com'
  end
end
