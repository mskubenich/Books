require_relative '../minitest_helper'
include ApplicationHelper

class ApplicationHelperTest < AcceptanceSpec

	describe "ApplicationHelper", js: true  do
		it "should show titles"	do
			
			@full_title.wont_equal []
			
			assert_equal(full_title("Sign up"), "BooksApp | Sign up")
		end
	end
end