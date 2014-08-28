require_relative '../minitest_helper'

class UserTest < MiniTest::Spec
  describe User do

  	before do

      @user = FactoryGirl.create(:user, name: 'Example User', email: 'user@example.com', password: 'qwerty', password_confirmation: 'qwerty')
  	end	
    
    it 'should respond to name' do
      @user.name.must_equal 'Example User'
    end	

    it 'should respond to email' do
      @user.email.must_equal 'user@example.com'
    end	

    it 'should respond to password' do
      @user.password.must_equal 'qwerty'
    end	

    it 'should respond to password_confirmation' do
      @user.password_confirmation.must_equal 'qwerty'
    end	
  end
end
