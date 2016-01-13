FactoryGirl.define do
	
  factory :user do
    email { Faker::Internet.email }
    password "password"
    role "role"
  end

end
