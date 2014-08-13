require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  
  test 'author has_many books' do
    assert have_many(:books)
  end
	
end
