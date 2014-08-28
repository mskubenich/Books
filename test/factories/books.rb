# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book, class: 'Book' do
  	sequence(:title) { |n| "Book #{n}" }
  	description  'test description'
  	author       nil
  	genres       []
  	year         2013
  	pages        207
  	format       'test format'
  	language     'test language'
  	size         100
  	created_at   Time.now
  	updated_at   nil
  end
end
