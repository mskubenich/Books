require_relative '../minitest_helper'

class UsersControllerTest
  describe UsersController do
    it "should get new" do
      get :new
      response_must_be :success
    end
  end
end

# !!!!
require  "minitest_helper"

describe UsersController do
  it "converts number to currency" do
    skip "Do this now"
    number_to_currency(1).must_equal "list 1"
  end
end