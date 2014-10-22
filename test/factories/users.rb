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