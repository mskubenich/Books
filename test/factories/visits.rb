# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visit do

	ip '0.0.0.0'
	browser 'Firefox'
	browser_version '123'
	os_name 'Windows'
	os_version '8'
	device 'mobile'
  	created_at            Time.now
  	updated_at            nil
  end
end
