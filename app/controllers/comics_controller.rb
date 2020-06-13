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

	def rank
		if @comics = params[:tag_id].present?
		   @comics = Tag.find(params[:tag_id]).comics
		else
			@comics = Comic.find(Bookmark.group(:comic_id).order('count(comic_id) desc').pluck(:comic_id))
		end
	end

end
