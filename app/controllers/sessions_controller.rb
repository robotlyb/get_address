#encoding: utf-8
class SessionsController < ApplicationController
	require 'debugger'
	def new
		
	end
	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or user
		else
			flash[:error] = "不匹配帐号与密码！请重新填写"
			render 'new'
		end	
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
