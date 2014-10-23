require_relative '../minitest_helper'

class BookTest < MiniTest::Spec
  describe Book do
  
    before do
      @book = FactoryGirl.create :book
    end

    it 'should belongs_to author' do
      @book.author.must_equal nil
    end 

    it "has_and_belongs_to_many genres" do
      @book.genres.must_equal []
    end
  end
end



require "minitest_helper"

describe Product do
  it "includes name in to_param" do
    product = Product.create!(name: "Book")
    product.to_param.must_equal "#{product.id}-Book"
  end
end
