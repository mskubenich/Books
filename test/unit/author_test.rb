require_relative '../minitest_helper'

class AuthorTest < MiniTest::Spec
  describe Author do

    before do
      @author = FactoryGirl.create :author
    end

    it 'should has many books' do
      @author.books.must_equal []
    end 
  end
end
