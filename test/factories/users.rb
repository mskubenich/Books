# Read about factories at https://github.com/thoughtbot/factory_girl
# 1-st variant user:
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
# 2-nd var.(my):
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

