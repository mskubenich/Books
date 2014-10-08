FactoryGirl.define do
  factory :visit do
    ip               '0.0.0.0'
  	browser         'Opera'
  	browser_version '11'
  	os_name         'Linux'
  	os_version      'i686'
  	device          'Computer'
  end
end