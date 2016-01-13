FactoryGirl.define do
  factory :invite, :class => Invite do                       
  	name Faker::Name.name  
  	start_date Faker::Date.forward(23)
  	address Faker::Address.street_address
  	end_date Faker::Date.forward(24)
  	description Faker::Lorem.sentence
  	allow_others false                                     	
  end
end
  