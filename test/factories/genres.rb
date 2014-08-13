# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :genre do
  	name         'name'
  	created_at   Time.now
  	updated_at   nil
  end
end
