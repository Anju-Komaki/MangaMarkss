# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comic = Comic.find(params[:comic_id])
    comment = current_user.comments.new(comment_params)
    comment.comic_id = comic.id
    comment_comic = comment.comic
    comment.save!
    redirect_to comic_path(comic)
  end

  def destroy
    comment = Comment.find(params[:comic_id])
    comic = comment.comic
    comment.destroy!
    redirect_to comic_path(comic)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :rate)
  end
end
