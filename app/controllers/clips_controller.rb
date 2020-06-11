class ClipsController < ApplicationController

	def create
		comic = Comic.find(params[:comic_id])
		clip = current_user.clips.new(comic_id: comic.id)
		clip.save
		redirect_to comic_path(comic)
	end

	def destroy
		comic = Comic.find(params[:comic_id])
		clip = current_user.clips.find_by(comic_id: comic.id)
		clip.destroy
		redirect_to comic_path(comic)
	end
end
