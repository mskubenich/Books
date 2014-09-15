require 'minitest_helper'

class Admin::StatisticsControllerTest
  describe Admin::StatisticsController do
    it "should get index" do
      get :index
      response_must_be :success
    end
  end
end