require_relative '../minitest_helper'

class FriendshipTest
  describe "Friendship Integration" do

    before do
      @user = FactoryGirl.create(:user,  name: 'Foo Bar',
                                 email: 'foobar@example.com',
                                 password: 'foobar',
                                 password_confirmation: 'foobar')
      #Log in as Foo Bar
      visit signin_path
      fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password
      find('.btn.btn-primary.btn-lg').click
    end

    it "must have 'find more friends' link" do
      page.must_have_link 'Find more friends', href: users_path
      page.must_have_content 'Friends'
      page.must_have_content 'You have 0 friends'
    end

    it "must have 'add to friends' link" do
      find('.btn.btn-info').click
      page.find_link('Add to friends').wont_be_nil
    end
  end
end