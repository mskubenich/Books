require_relative '../minitest_helper'

class BooksTest < AcceptanceSpec
  describe "Books", js: true do
  	before do
  		@user = FactoryGirl.create :user
  		@book1 = FactoryGirl.create :book, title: 'dsf'
  		@book2 = FactoryGirl.create :book, title: 'Kobzar', description: 'Taras Shevchenko', year: '1840', language: 'Ukrainian', pages: '0'
  	end
	  it 'shoud show the BookList table' do
	  	visit '/signin'
	  	fill_in "Email", :with => @user.email
      fill_in "Password", :with => @user.password
      find('.btn.btn-primary.btn-lg').click

      click_on "Books"
      find('.book-list thead tr:nth-child(1) th:nth-child(1)').must_have_content 'Title'
      find('.book-list thead tr:nth-child(1) th:nth-child(2)').must_have_content 'Description'
      find('.book-list tbody tr:nth-child(1) td:nth-child(3)').must_have_content '2013'
      find('.book-list tbody tr:nth-child(1) td:nth-child(4)').must_have_content 'test language'
      find('.book-list tbody tr:nth-child(1) td:nth-child(5)').must_have_content '207'
      find('.book-list tbody tr:nth-child(2) td:nth-child(1)').must_have_content 'Kobzar'
      find('.book-list tbody tr:nth-child(2) td:nth-child(2)').must_have_content 'Taras Shevchenko'
      find('.book-list tbody tr:nth-child(2) td:nth-child(3)').must_have_content '1840'
      find('.book-list tbody tr:nth-child(2) td:nth-child(4)').must_have_content 'Ukrainian'
      find('.book-list tbody tr:nth-child(2) td:nth-child(5)').must_have_content '0'
	  end
  end
end