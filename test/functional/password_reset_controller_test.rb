require_relative '../minitest_helper'

class PasswordResetControllerTest

  describe PasswordResetsController do

    before do
      @user = FactoryGirl.create(:user)
      @user.password_reset_token = SecureRandom.urlsafe_base64
      @user.password_reset_sent_at = Time.now-1.hour
      @user.save
    end

    it "should find user by email" do
      post :create, {user: { email: @user.email}}

      response_must_be :success
      assert_redirected_to root_path
    end

    it "should edit" do
      get :edit, id:@user.password_reset_token

      response_must_be :success
    end

    it "should update user password" do
      patch :update, user: { password: "newpass",
                              password_confirmation: "newpass"},
            id:@user.password_reset_token

      response_must_be :success
      assert_redirected_to signin_path
    end
  end
end