require_relative '../minitest_helper'
include SessionsHelper

class UsersControllerTest
  describe UsersController do

    it "should get new" do
      get :new
      response_must_be :ok
    end

    it "should post create" do
      post :create, {user: { name: 'Example',
                             email: 'user@gmail.com',
                             password: '[FILTERED]',
                             password_confirmation: '[FILTERED]'}}
      response_must_be :ok
    end

      it 'should  get edit' do
        @user = FactoryGirl.create(:user)
        sign_in @user
        get :edit
        response_must_be :ok
      end

    it "should post update" do
      @user = FactoryGirl.create(:user)
      sign_in @user
      patch :update, {user: { current_password: 'qwerty',
                              name: 'Example User',
                              email: 'user@gmail.com',
                              password: '[FILTERED]',
                              password_confirmation: '[FILTERED]'},

                      id: @user.id
                     }

      response_must_be :ok
    end  
   
    it 'should get confirm' do
      @user = FactoryGirl.create(:user)
      sign_in @user
      get :confirm 
      response_must_be :ok
    end  
  end
<<<<<<< HEAD
=======
end

# !!!!
require  "minitest_helper"

describe UsersController do
  it "converts number to currency" do
    skip "Do this now"
    number_to_currency(1).must_equal "list 1"
  end
>>>>>>> sessions_helper_test
end