require_relative '../minitest_helper'

class BookTest < MiniTest::Spec
  describe Book do

    before do
      @book = FactoryGirl.create :book
    end

    it "should have many books" do
      @book.year.must_equal 2013
    end

    #test 'book belong_to author' do
    #  assert belong_to(:author)
    #end
    #
    #test 'has_and_belongs_to_many genres' do
    #  assert have_and_belong_to_many(:genre)
    #end

  end
end



require "minitest_helper"

describe Product do
  it "includes name in to_param" do
    product = Product.create!(name: "Book")
    product.to_param.must_equal "#{product.id}-Book"
  end
end