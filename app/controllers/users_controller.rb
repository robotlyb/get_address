#encoding: utf-8
class UsersController < ApplicationController
#require 'debugger'
	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :rewrite_flag
	before_filter :rewrite_plan_flag
	before_filter :correct_user, only: [:edit, :update]
	def new
		@user = User.new
	end
	def show 
		@user = User.find(params[:id])
		@questions = @user.questions.paginate(page: params[:page])
	end
	def create
		@user = User.new(params[:user])
#	debbuger
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
	end
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "修改成功！"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def show_my_question
		@question = current_user.questions.paginate(page: params[:page])
	end

	def show_my_answer_question
		@question = current_user.answers.questions.paginate(page: params[:page])
	end

	def show_my_plan
		@plan = current_user.plans.paginate(page: params[:page])
	end

	def show_my_comment_plan
		@plan = current_user.comments.plans.paginate(page: params[:page])
	end
	private
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end

end
