class ComicsController < ApplicationController
	def index
		@comics = params[:tag_id].present? ? Tag.find(params[:tag_id]).comics : Comic.all
	end

	def show
		@comic = Comic.find(params[:id])
		@comment = Comment.new
	end

end
