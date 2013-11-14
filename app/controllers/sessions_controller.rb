#encoding: utf-8
class SessionsController < ApplicationController
	require 'debugger'
	def new
		
	end
	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash[:error] = "无效的用户名或密码！请重新填写"
			render 'new'
		end	
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
