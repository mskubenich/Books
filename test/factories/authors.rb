# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :author do
  	name         'test name'
  	surname      'test surname'
  	created_at   Time.now
  	updated_at   nil
  end
end
