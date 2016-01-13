# invites_controller_spec.rb
require 'rails_helper'
require 'spec_helper'

describe Admin::AdminController, :type => :controller do

	before do |example|
	  @user = FactoryGirl.create(:user)
	end
	describe "GET #" do
		it "renders the :index view" do
			allow(controller).to receive(:current_user).and_return(@user)

			get :index
			# expect(response).to render_template :index
		end
	end
end 