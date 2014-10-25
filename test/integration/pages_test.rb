require_relative '../minitest_helper'

class PagesTest
  describe "Pages Integration", :js => true do
  # !!! Verify the correctness:
    it 'should find hello on home page' do
      visit root_path
      page.must_have_content ("Hello!!!")
    end
  end
end
# !!! Verify the correctness:

require "minitest_helper"

describe "Products integration" do
  it "shows product's name" do
    product = Product.create!(name: "Books")
    visit product_path(product)
    page.text.must_include "Books"
  end
end
