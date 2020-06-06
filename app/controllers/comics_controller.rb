class ComicsController < ApplicationController
	def index
		@comics = Comic.all
		if params[:tag_name]
		@comics = Comic.tagged_with("#{params[:tag_name]}")
	    end
	end

	def show
		@comic = Comic.find(params[:id])
		@comment = Comment.new
		@user = User.find(params[:id])
	end
    private

    def comic_params
    params.require(:comic).permit(:tag_list)
    end

end
