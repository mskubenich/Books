require_relative '../../minitest_helper'

class UsersControllerTest
  describe Admin::UsersController do
    it "should display users list" do
      get :index
      response_must_be :success
    end
  end
end
