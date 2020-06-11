class InformationsController < ApplicationController
	def index
		@informations = Information.all
		#if params[:tag_name]
			#@informations = Information.tagged_with("#{params[:tag_name]}")
		#end
	end

	def show
		@information = Information.find(params[:id])
	end
end
