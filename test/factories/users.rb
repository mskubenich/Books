<<<<<<< HEAD
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
=======
include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@mail.com" }
    password "Test123"
    password_confirmation "Test123"
    avatar { fixture_file_upload(Rails.root.join('test', 'factories', 'images', 'taco.png'), 'image/png') }
  end
end
>>>>>>> sessions_helper_test
