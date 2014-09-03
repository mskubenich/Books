# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
  	name 'Factory Role'

    factory :user_role do
      name 'User'
    end

    factory :admin_role do
      name 'Admin'
    end
  end
end
