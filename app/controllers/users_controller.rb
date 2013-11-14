#encoding: utf-8
class UsersController < ApplicationController
#	require 'debbuger'
	def new
		@user = User.new
	end
	def show 
		@user = User.find(params[:id])
#	debbuger
	end
	def create
		@user = User.new(params[:user])
#	debbuger
		respond_to do |format|
			if @user.save
				sign_in @user
				flash[:success] = "注册成功！你当前以#{@user.name}身份登录！"	
				redirect_to @user
			else
				format.html{render action: 'new'}
			end
		end		
	end	
end
