require_relative '../minitest_helper'

class AdminsControllerTest
   describe Admin::AdminsController do

      it 'should redirect login_user' do
      	get :index
      	response_must_be :redirect
      end	

      it 'should redirect user' do
        @user = FactoryGirl.create(:user)
        get :index
        response_must_be :redirect
      end

      it 'should success admin' do
        @user = FactoryGirl.create(:admin)
        response_must_be :success
      end	
   end	
end	