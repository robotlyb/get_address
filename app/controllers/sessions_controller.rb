#encoding: utf-8
class SessionsController < ApplicationController
	require 'debugger'
	before_filter :rewrite_user_flag
	before_filter :rewrite_flag
	before_filter :rewrite_plan_flag
	def new
		
	end
	def create
		rewrite_flag
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or root_path 
		else
			flash[:error] = "不匹配的帐号与密码！请重新填写"
			render 'new'
		end	
		
		
		
	end

	def destroy
		rewrite_flag	
		sign_out
		redirect_to root_path
	end
end
