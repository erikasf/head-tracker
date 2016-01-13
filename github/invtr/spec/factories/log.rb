FactoryGirl.define do
  factory :log, :class => Log do                       
  	type ["Invite"].sample
  	action ["accept", "decline", "report", "create_report"].sample
  	data '{"name": "Invite name", "description": "Invite description"}'       	
  end
end
