require_relative '../minitest_helper'

class GenreTest < MiniTest::Spec
  describe Genre do

    before do
      @genre = FactoryGirl.create :genre
    end

    #test 'genre has_and_belongs_to_many books ' do
    #  assert have_and_belong_to_many(:books)
    #end

  end
end
