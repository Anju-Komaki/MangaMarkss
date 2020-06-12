class Admins::ComicsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@comics = Comic.all
	end

	def show
		@comic = Comic.find(params[:id])
	end

	def new
		@comic = Comic.new
	end

	def create
		@comic = Comic.new(comic_params)
		if @comic.save!
		    redirect_to admins_comics_path
		else
			render 'new'
		end
	end

	def edit
		@comic = Comic.find(params[:id])
	end

	def update
		@comic = Comic.find(params[:id])
		@comic.update(comic_params)
		redirect_to admins_comic_path(@comic)
	end

	def destroy
		@comic = Comic.find(params[:id])
		@comic.destroy
		redirect_to admins_comics_path
	end

	private
	def comic_params
		params.require(:comic).permit(:title, :isbn_code, :author, :publisher, :title_en, :author_en, :publisher_en, :comic_image, :body, tag_ids:[])
	end
end
