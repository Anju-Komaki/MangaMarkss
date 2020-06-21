# frozen_string_literal: true

class ClipsController < ApplicationController
  before_action :authenticate_user!
  def create
    comic = Comic.find(params[:comic_id])
    clip = current_user.clips.new(comic_id: comic.id)
    clip.save!
    redirect_to comic_path(comic)
  end

  def destroy
    comic = Comic.find(params[:comic_id])
    clip = current_user.clips.find_by(comic_id: comic.id)
    clip.destroy!
    redirect_to comic_path(comic)
  end

  def clip_index
    @user = User.find(params[:id])
    @clips = Clip.where(user_id: @user.id).all
  end
end
