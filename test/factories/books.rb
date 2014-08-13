# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
  	id
  	title        'test title'
  	description  'test description'
  	author       { FactoryGirl.create(:author) }
  	genre        { FactoryGirl.create(:genre) }
  	year         2013
  	pages        207
  	format       'test format'
  	language     'test language'
  	size         100
  	created_at   Time.now
  	updated_at   nil
  end
end
