#encoding: utf-8
class UsersController < ApplicationController
#require 'debugger'
	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :correct_user, only: [:edit, :update]
	def new
		@user = User.new
		rewrite_flag
	end
	def show 
		@user = User.find(params[:id])
		@questions = @user.questions.paginate(page: params[:page])
		rewrite_flag
	end
	def create
		@user = User.new(params[:user])
#	debbuger
		rewrite_flag
		respond_to do |format|
			if @user.save
				sign_in @user
				flash[:notice] = "注册成功！你当前以#{@user.name}身份登录！"	
				format.html{redirect_to @user}
			else
				format.html{render action: 'new'}
			end
		end		
	end	
	def edit
		@user = User.find(params[:id])
		rewrite_flag
	end
	def update
		@user = User.find(params[:id])
		rewrite_flag
		if @user.update_attributes(params[:user])
			flash[:success] = "修改成功！"
			redirect_to @user
		else
			render 'edit'
		end
	end
	private
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end
end
