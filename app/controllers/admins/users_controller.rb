class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def csv_download
		@users = User.all
		create_csv_file_header("user#{Time.zone.now.strftime('%Y%m%d')}")
	end
	def create_csv_file_header(file_name)
		file_name = ERB::Util.url_encode(file_name) if (/MSIE/ =~ request.user_agent) || (/Trident/ =~ request.user_agent)
		headers['Content-Disposition'] = "attachemet; filename=\"#{file_name}.csv\""
	end
end
