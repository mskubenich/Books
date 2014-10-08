# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visit do
    ip               '93.192.76.1'
  	browser         'Opera'
  	browser_version '11'
  	os_name         'Linux'
  	os_version      'i686'
  	device          'Computer'
  end
end