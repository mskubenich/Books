require_relative '../minitest_helper'

class GenreTest < MiniTest::Spec
  describe Genre do

    before do
      @genre = FactoryGirl.create :genre
    end

    it 'has_and_belongs_to_many books' do
      @genre.books.must_equal []
    end 

  end
end
