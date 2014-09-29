require_relative '../../minitest_helper'

class Admin::UsersTest < AcceptanceSpec
  describe "Users", js: true do
	  it 'shoud show the UserList table' do

			visit admin_users_path
     
      find('.user-list thead tr:nth-child(1) th:nth-child(1)').must_have_content 'Name'
      find('.user-list thead tr:nth-child(1) th:nth-child(2)').must_have_content 'Email'
      find('.user-list tbody tr:nth-child(2) th:nth-child(1)').must_have_content 'Віталій Коваленко'
      find('.user-list tbody tr:nth-child(2) th:nth-child(2)').must_have_content 'example@gmail.com'
	  end
  end
end