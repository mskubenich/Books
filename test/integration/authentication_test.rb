require_relative '../minitest_helper'

class AuthenticationTest
  describe "Login/Logout Integration", :js => true do

    before do
      @user = FactoryGirl.create(:user, name: "Test User", email: "test@example.com", password: "foobar", password_confirmation: "foobar")
    end

    it 'signin page' do
      visit signin_path

      page.must_have_content 'Sign in'
      page.must_have_title 'Sign in'
    end

    it 'signin with valid information' do
      visit signin_path
      fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password
      find('.btn.btn-primary.btn-lg').click

      page.must_have_title  @user.name
      page.must_have_content  @user.name
      page.must_have_link  'Profile', href: profile_path
      page.must_have_link  'Sign out', href: signout_path
      page.must_have_link  'Edit your profile', href: edit_profile_path

      describe "folowed by signout" do
        before { click_link "Sign out" }
        it {must_have_link 'Sign in', href: signin_path}
      end
    end

    it 'signin with wrong parameters' do
      visit signin_path
      find('#session_email').set('Test@ex.com')
      find('#session_password').set('foo')
      find('.btn.btn-primary.btn-lg').click

      page.must_have_link 'Sign in', href: signin_path
      page.must_have_link 'Admin', href: admin_statistics_path
      page.must_have_link 'SignUp', href: signup_path

      page.wont_have_link 'Profile'
      page.wont_have_link 'Sign out'
    end

  end
end