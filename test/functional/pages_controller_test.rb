require_relative '../minitest_helper'

class PagesControllerTest
  describe PagesController do
    it "should get index" do
      get :index
      response_must_be :success
    end
  end
end
