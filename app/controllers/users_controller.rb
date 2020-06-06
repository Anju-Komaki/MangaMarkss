class UsersController < ApplicationController
    before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		#ユーザのブックマーク一覧表示
		@bookmarks = Bookmark.where(user_id: @user.id).all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		   flash[:update] = "プロフィールを更新しました"
		   redirect_to user_path(@user)
		else
		   render :edit
		end
	end

    #退会ページの表示
	def withdraw
	end
	#退会(論理削除)の処理
	def hide
		current_user.update(is_valid: false)
		reset_session
		flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
		redirect_to root_path
	end

	#フォロー＆フォロワー一覧
	def following
		@user = User.find(params[:id])
		@users = @user.following
		render 'index_follow'
	end

	def followers
		@user = User.find(params[:id])
		@users = @user.followers
		render 'index_follower'
	end

	private
	def user_params
		params.require(:user).permit(:is_valid, :username, :caption, :profile_image)
	end
end
