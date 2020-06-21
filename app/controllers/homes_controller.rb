# frozen_string_literal: true

class HomesController < ApplicationController
  def top
    @rankings = Comic.find(Bookmark.group(:comic_id).order('count(comic_id) desc').limit(5).pluck(:comic_id))
    @informations = Information.all.order(created_at: :desc).limit(3)
  end

  def about; end
end
