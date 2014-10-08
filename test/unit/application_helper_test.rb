require_relative '../minitest_helper'

class ApplicationHelperTest < AcceptanceSpec

	describe "ApplicationHelper", js: true  do
		it "should show titles"	do
			
			visit signin_path
			title.must_have_content "BooksApp | Sign in"

			visit signup_path
			title.must_have_content "BooksApp | Sign Up"
		end
	end
end