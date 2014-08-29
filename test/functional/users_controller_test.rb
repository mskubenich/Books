require_relative '../minitest_helper'

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
        get :edit, id: @user.id
        response_must_be :ok
    end

    it "should post update" do
      @user = FactoryGirl.create(:user)

      patch :update, {user: { name: 'Example User',
                              email: 'user@gmail.com',
                              password: '[FILTERED]',
                              password_confirmation: '[FILTERED]'},

                      id: @user.id
                     }

      response_must_be :ok
    end
  end
end