require_relative '../minitest_helper'

class AuthorizationTest
  describe "Login/Logout Integration", :js => true do

    it 'should login' do
      visit signin_path
      screenshot_and_open_image
    end

  end
end