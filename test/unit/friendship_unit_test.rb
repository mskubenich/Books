require_relative '../minitest_helper'

class FriendshipTest < MiniTest::Spec
  describe Friendship do

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

    it "should send friendship request" do
      Friendship.request(@user, @friend)
      assert Friendship.exists?(@user, @friend)
      assert_status @user, @friend, 'pending'
      assert_status @friend, @user, 'requested'
    end

    it "should accept friendship" do
      Friendship.request(@user, @friend)
      Friendship.accept(@user, @friend)
      assert Friendship.exists?(@user, @friend)
      assert_status @user, @friend, 'accepted'
      assert_status @friend, @user, 'accepted'
    end

    it "should breakup friendship" do
      Friendship.request(@user, @friend)
      Friendship.breakup(@user, @friend)
      assert !Friendship.exists?(@user, @friend)
    end
  end

  private

  def assert_status (user, friend, status)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    assert_equal status, friendship.status
  end
end