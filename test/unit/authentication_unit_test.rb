require_relative '../minitest_helper'
include SessionsHelper

class AuthenticationUnitTest

  describe "Authentication" do

    before do
      @user = FactoryGirl.create(:user)
    end

    it "user remember token" do
      @user.remember_token.wont_equal nil
    end

  end

end