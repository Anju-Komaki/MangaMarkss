class Admins::InformationsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@informations = Information.all
		if params[:tag_name]
			@informations = Information.tagged_with("#{params[:tag_name]}")
		end
	end

	def show
		@information = Information.find(params[:id])
	end

	def new
		@information = Information.new
	end

	def create
		@information = Information.new(information_params)
		@information.save
		redirect_to admins_informations_path
	end

	def edit
		@information = Information.find(params[:id])
	end

	def update
		@information = Information.find(params[:id])
		@information.update(information_params)
		redirect_to admins_information_path(@information)
	end

	def destroy
		@information = Information.find(params[:id])
		@information.destroy
		redirect_to admins_informations_path
	end

	private
	def information_params
		params.require(:information).permit(:title, :body, :tag_list)
	end
end
