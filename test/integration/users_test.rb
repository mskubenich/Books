require_relative '../minitest_helper'

class PagesTest
  describe "Users Integration", :js => true do
    it 'should find field on registration page' do
      visit signup_path
      find('#user_name').set('Example')
      find('#user_email').set('user@gmail.com')
      find('#user_password').set('qwerty')
      find('#user_password_confirmation').set('qwerty')
      find('.btn.btn-primary.btn-lg').click

      page.must_have_content 'You have successfully registered. We send you an activation email! Please check your email and click the link to activate the report.'
      user = User.where(email: 'user@gmail.com').first
      user.sign_in_token.wont_be_nil
      user.update_attribute('sign_in_token', nil)
      user.sign_in_token.must_equal nil

      # visit user
      sdfsgs
    end
  end
end