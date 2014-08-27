require_relative '../minitest_helper'

class AuthorTest < MiniTest::Spec
  describe Author do

    before do
      @author = FactoryGirl.create :author
    end

    #it "should have many books" do
    #  should have_many(:books)
    #end
  end
end
