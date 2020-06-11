class ComicsController < ApplicationController
	def index
		 #@comics = Comic.all
		 #if params[:tag_name]
		   #@comics = Comic.tagged_with("#{params[:tag_name]}")
	     #end
	   	 @comics = Comic.all
	end

	def show
		@comic = Comic.find(params[:id])
		@comment = Comment.new
		#@user = User.find(params[:id])
	end

end
