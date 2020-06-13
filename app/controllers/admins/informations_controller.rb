class Admins::InformationsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@informations = Information.all
	end

	def show
		@information = Information.find(params[:id])
	end

	def new
		@information = Information.new
	end

	def create
		@information = Information.new(information_params)
		if @information.save
		   flash[:message] = "新規登録しました"
		   redirect_to admins_informations_path
		else
			flash[:message] = "新規登録できませんでした"
			render 'new'
		end
	end

	def edit
		@information = Information.find(params[:id])
	end

	def update
		@information = Information.find(params[:id])
		if @information.update(information_params)
		   flash[:message] = "内容を更新しました"
	       redirect_to admins_information_path(@information)
	    else
	   	  flash[:message] = "内容を更新できませんでした"
	   	  render 'edit'
	   	end
	end

	def destroy
		@information = Information.find(params[:id])
		@information.destroy
		flash[:message] = "削除しました"
		redirect_to admins_informations_path
	end

	private
	def information_params
		params.require(:information).permit(:title, :body, category_ids:[])
	end
end
