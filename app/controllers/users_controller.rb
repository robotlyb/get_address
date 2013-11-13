class UsersController < ApplicationController
  def new
		@user = User.new
	end
	def show 
		@user = User.find_by_name(params[:name])
	end
	def create
		@user = User.new(params[:user])
		respond_to do |format|
			if @user.save
				format.html{redirect_to show_path, notice:"注册成功！"}
			else
				format.html{render action: 'new'}
			end
		end		
	end	
end
