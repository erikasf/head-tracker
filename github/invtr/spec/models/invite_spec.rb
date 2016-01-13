require 'rails_helper'
require 'spec_helper'

RSpec.describe Invite, type: :model do
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:address) }
	it { should validate_presence_of(:description) }
	it { should validate_length_of(:name).is_at_most(150) }
	it { should validate_length_of(:description).is_at_most(1000) }
	it { should validate_presence_of(:start_date) }	 
	it { should validate_presence_of(:end_date)	}
	it { should validate_presence_of(:allow_others)	}

	before(:all) do
	    @invite = FactoryGirl.create(:invite)
	    @email = "test@email.com"
	    @report_text = "Report Text"
	 end

    describe 'accept' do
 		it "adds the email param to the 'accepted' array on Invite" do
 			@invite.accept(@email)
 			expect(@invite.accepted).to include(@email)
 			expect(@invite.declined).to_not include(@email)
 		end
    end

   describe 'decline' do
		it "adds the email param to the 'declined' array on Invite" do
			@invite.decline(@email)
			expect(@invite.accepted).to_not include(@email)
			expect(@invite.declined).to include(@email)
		end
   end


	describe 'add_report_text' do
		it "adds the report to the reports array on Invite" do
			@invite.add_report_text(@report_text)
			expect(@invite.reports).to include(@report_text)
		end
	end

	describe "add report count" do
		it "Increments the report counter" do
			report_count = @invite.report_count
			@invite.add_report_count
			expect(@invite.report_count).to eq(report_count + 1)
		end
	end
end