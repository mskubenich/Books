require_relative '../minitest_helper'

class MailerTest < MiniTest::Spec
  describe UserMailer do
  	before do
      @user = FactoryGirl.create(:user, name: 'Example User', email: 'user@example.com', password: 'qwerty', password_confirmation: 'qwerty') 
      @mail = UserMailer.account_confirmation_mailer(@user,'books.com')
    end	
    
    it "should send user confirmation" do
      @mail.subject.must_equal 'Welcome to My Awesome Site'
      @mail.to.must_equal ([@user.email])
      @mail.from.must_equal(["admin@gmail.com"])
    end
  end
end