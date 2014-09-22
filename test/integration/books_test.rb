require_relative '../minitest_helper'

class BooksTest
  describe "Books", js: true do
	  it 'shoud show the BookList table' do
	  	visit '/signin'
	  	fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password
      find('.btn.btn-primary.btn-lg').click

      click_on "BOOKS"
      dfkaplmd
	  end
  end
end