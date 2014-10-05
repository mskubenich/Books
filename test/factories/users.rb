# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	name                  'user name'
  	email                 'user@gmail.com'
  	password              'qwerty'
  	password_confirmation 'qwerty'
  	avatar                { File.new(Rails.root+ 'app/assets/images/default_avatar.png') }
  	created_at            Time.now
  	updated_at            nil
  end
end
