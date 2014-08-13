require 'test_helper'

class GenreTest < ActiveSupport::TestCase
 
  test 'genre has_and_belongs_to_many books ' do
    assert have_and_belong_to_many(:books)
  end

end
