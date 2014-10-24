require_relative '../minitest_helper'

class RememberMeTest < AcceptanceSpec
  describe "Integration tests for remebmer me failure", :js => true do
    before do
      @user = FactoryGirl.create :user
    end
    it 'should find current user by cookies' do
  	  visit '/signin'
      fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password

      @user.remember_token.wont_equal nil
    end
  end 
end