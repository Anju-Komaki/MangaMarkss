class Admins::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
       flash[:message] = "カテゴリー名を登録しました"
       redirect_to admins_categories_path
    else
      flash[:message] = "カテゴリー名を登録できませんでした"
      redirect_to admins_categories_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
       flash[:message] = "カテゴリー名を変更しました"
       redirect_to admins_categories_path
    else
      flash[:message] = "カテゴリー名を変更できませんでした"
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:message] = "カテゴリーを削除しました"
    redirect_to admins_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
