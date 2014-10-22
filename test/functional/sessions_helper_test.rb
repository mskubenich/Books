require_relative '../minitest_helper'

class SessionHelperTest
  describe ApplicationController do
    it "should sign in user" do
      @controller = PagesController.new
      get :index
     puts "+++++++++++++++++++"
     puts @response.inspect
    end
  end
end