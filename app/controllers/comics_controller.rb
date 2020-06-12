class ComicsController < ApplicationController
	def index
		if	@comics = params[:tag_id].present?
			@comics = Tag.find(params[:tag_id]).comics
		else
			@comics = Comic.all
		end
	end

	def show
		@comic = Comic.find(params[:id])
		@comment = Comment.new
	end

end
