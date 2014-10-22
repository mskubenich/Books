require_relative '../minitest_helper'

class SessionHelperTest <  MiniTest::Spec
  include SessionsHelper

 # -   Перевіряє, що незалогінений юзер - фолс
  describe "signed_in?" do
    it "should return false if user didn't signed in" do
      user = FactoryGirl.create(:user)
      # puts user.inspect
      # current_user = user
      assert_not signed_in?
    end

# - Перев., що юзер залог - true
   it "should return true if user signed in" do
      user = FactoryGirl.create(:user)
      sign_in(user)
      assert signed_in?
    end
  end

end










# require 'minitest_helper'

# class Admin::AdminsControllerTest < ActionController::TestCase
   # test "should get index" do
#     get :index
#     assert_response :success
#   end

# end


