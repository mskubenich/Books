# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	name                  'user name'
  	email                 'user@gmail.com'
  	password              'qwerty'
  	password_confirmation 'qwerty'
  	avatar                { File.new(Rails.root+ 'app/assets/images/01.png') }
  	created_at            Time.now
  	updated_at            nil
  	roles                 { [FactoryGirl.create(:user_role)] }

    after(:create) do |user|
      user.roles = [FactoryGirl.create(:user_role)]
    end

    factory :admin do
      after(:create) do |user|
      	user.roles = [FactoryGirl.create(:admin_role)]
      end	
    end
  end
end
