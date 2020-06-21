# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :authenticate_user!
  def create
    comic = Comic.find(params[:comic_id])
    bookmark = current_user.bookmarks.new(comic_id: comic.id)
    bookmark.save!
    redirect_to comic_path(comic)
  end

  def destroy
    comic = Comic.find(params[:comic_id])
    bookmark = current_user.bookmarks.find_by(comic_id: comic.id)
    bookmark.destroy!
    redirect_to comic_path(comic)
  end
end
