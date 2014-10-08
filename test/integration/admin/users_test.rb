require_relative '../../minitest_helper'

class Admin::UsersTest < AcceptanceSpec
  
  describe "Users", js: true do

	  	before do
	  		@user = FactoryGirl.create :user, name: 'asaf', email: 'avidan@m.com'
	  	end

	  	it 'shoud show the UserList table' do
			visit admin_users_path
     
      find('.book-list thead tr:nth-child(1) th:nth-child(1)').must_have_content 'Name'
      find('.book-list thead tr:nth-child(1) th:nth-child(2)').must_have_content 'Email'
      find('.book-list tbody tr:nth-child(1) td:nth-child(1)').must_have_content 'asaf'
      find('.book-list tbody tr:nth-child(1) td:nth-child(2)').must_have_content 'avidan@m.com'
	  end
  end
end