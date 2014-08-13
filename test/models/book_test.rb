require 'test_helper'

class BookTest < ActiveSupport::TestCase
  
  test 'book belong_to author' do
    assert belong_to(:author)
  end

  test 'has_and_belongs_to_many genres' do
    assert have_and_belong_to_many(:genre)
  end

end
