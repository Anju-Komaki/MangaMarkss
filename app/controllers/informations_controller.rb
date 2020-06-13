class InformationsController < ApplicationController
	def index
		if	@informations = params[:category_id].present?
			@informations = Category.find(params[:category_id]).informations
		else
			@informations = Information.all
		end
	end

	def show
		@information = Information.find(params[:id])
	end
end
