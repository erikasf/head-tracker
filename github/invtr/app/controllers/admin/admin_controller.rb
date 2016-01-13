module Admin
	class AdminController < ApplicationController
		before_action :authenticate_user!
		layout 'layouts/admin'
		def index
			@user = current_user
			@invite_count = Invite.count
			@accepted_count = Log.where(action: "accept").count
			@rejected_count = Log.where(action: "decline").count
			@report_count = Log.where(action: "report").count
			@written_report_count = Log.where(action: "create_report").count
			@sorted_reports = Invite.where(:report_count.gt => 0).where(active: true).order_by(report_count: "desc")
			@deactivated_count = Invite.where(active: false).count
			@logs = Log.all
		end
	end
end
