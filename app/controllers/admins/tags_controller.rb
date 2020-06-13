class Admins::TagsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:message] = "タグ名を登録しました"
      redirect_to admins_tags_path
    else
      flash[:message] = "タグ名を登録できませんでした"
      redirect_to admins_tags_path
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
       flash[:message] = "タグ名を変更しました"
       redirect_to admins_tags_path
    else
       flash[:message] = "タグ名を変更できませんでした"
       render 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:message] = "タグを削除しました"
    redirect_to admins_tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

end
