class ComicsController < ApplicationController
	def index
		@comics = Comic.find(Bookmark.group(:comic_id).order('count(comic_id) desc').pluck(:comic_id))
		if params[:tag_name]
		@comics = Comic.tagged_with("#{params[:tag_name]}")
	    end
	end

	def show
		@comic = Comic.find(params[:id])
		@comment = Comment.new
		@user = User.find(params[:id])
	end
end
