# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visit do
  	ip               '255.255.255.0'
  	browser         'Opera'
  	browser_version 'Opera'
  	os_name         'Linux'
  	os_version      'i686'
  	device          'Computer'
  	created_at      Time.now
  	updated_at      nil
  end
end
