require_relative '../minitest_helper'
include SessionsHelper

class SessionsControllerTest

  describe SessionsController do
    before do
      @user = FactoryGirl.create(:user)
    end

    def create_session
      post :create, {session: { email: @user.email,
                                password: @user.password}}
    end

    it "User session create" do
      create_session

      assert_redirected_to @user
      response_must_be :success
    end

    it "User session destroy" do
      create_session

      delete :destroy
      assert_redirected_to root_path
      response_must_be :success
    end
  end

end