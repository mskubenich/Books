require_relative '../minitest_helper'

class PagesTest
  describe "Registration Page Integration", :js => true do
    it 'should find field on registration page' do
      visit '/signup'
      find('#new_user #user_name').set('Example')
      find('#new_user #user_email').set('user@gmail.com')
      find('#new_user #user_password').set('qwerty')
      find('#new_user #user_password_confirmation').set('qwerty')
      find('.btn.btn-large.btn-primary').click
      page.must_have_content 'Example'
      
      
      visit '/edit_profile'
      find('.edit_user #user_name').set('Example User')
      find('.edit_user #user_email').set('user@gmail.com')
      find('.edit_user #user_password').set('qwerty')
      find('.edit_user #user_password_confirmation').set('qwerty')
      find('.btn.btn-large.btn-primary').click
      page.must_have_content 'Example User'
    end
  end
end