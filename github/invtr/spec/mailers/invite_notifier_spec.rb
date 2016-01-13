require "rails_helper"

RSpec.describe InviteNotifier, type: :mailer do
	before(:each) do 
	  @invite = FactoryGirl.create(:invite)
	  @mail = InviteNotifier.send_invite_email('email@email.com', @invite)
	end
	it 'renders the subject' do
	  expect(@mail.subject).to eq("Thanks for signing up for our amazing app")
	end
	
	# it 'renders the receiver email' do
	#   expect(@mail.to).to eq(["Dhruv@aol.com"])
	# end
end
