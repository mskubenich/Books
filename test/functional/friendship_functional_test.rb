require_relative '../minitest_helper'
include SessionsHelper

class FriendsiControllerTest
  describe FriendshipController do

    before do
      @user = FactoryGirl.create(:user,  name: 'Test User',
                                 email: 'test_user@example.com',
                                 password: 'testuser',
                                 password_confirmation: 'testuser')
      @friend = FactoryGirl.create(:user,  name: 'Friend User',
                                   email: 'friend_user@example.com',
                                   password: 'frienduser',
                                   password_confirmation: 'frienduser')
    end

    it "should create new friendship & accept friendship request" do
      sign_in @user
      get :create
      response_must_be :success
      assert_response :redirect
      assert_redirected_to profile_path
      assert_equal "Friend request sent.", flash[:notice] = "Friend request sent."

      sign_in @friend
      get :accept, :id => @friend.name
      response_must_be :success
      assert_redirected_to profile_path
      assert_equal "Friendship with #{@user.name} accepted!", flash[:notice] = "Friendship with #{@user.name} accepted!"
    end

    it "should decline friendship request" do
      sign_in @user
      get :create

      sign_in @friend
      get :decline, :id => @friend.name
      response_must_be :success
      assert_redirected_to profile_path
      assert_equal "Friendship with #{@user.name} declined!", flash[:notice] = "Friendship with #{@user.name} declined!"
    end

    it "should cencel friendship request" do
      sign_in @user
      get :create

      get :cancel, :id => @user.name
      response_must_be :success
      assert_redirected_to profile_path
      assert_equal "Friendship request canceled.", flash[:notice] = "Friendship request canceled."
    end

    it "should delete friendship" do
      sign_in @user
      get :create

      sign_in @friend
      get :accept, :id => @friend.name

      get :delete, :id => @friend.name
      response_must_be :success
      assert_redirected_to profile_path
      assert_equal "Friendship with #{@friend.name} deleted!", flash[:notice] = "Friendship with #{@friend.name} deleted!"
    end
  end
end