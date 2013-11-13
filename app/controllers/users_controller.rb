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
				format.html { redirect_to @user, notice:"注册成功！" }	
			else
				format.html{render action: 'new'}
			end
		end		
	end	
end
