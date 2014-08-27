require_relative '../minitest_helper'

class UsersControllerTest
  describe UsersController do
    it "should get new" do
      get :new
      response_must_be :success
    end
  end
end
