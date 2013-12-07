#encoding: utf-8
class CommentsController < ApplicationController
	before_filter :signed_in_user

	def new
		@comment = Comment.new
	end	

	def create
		@comment = Comment.new(params[:comment])
		@comment.user_id = current_user.id
		@comment.plan_id = current_plan.id

		respond_to do |format|
			if @comment.save
				format.html{redirect_to @comment.plan}
			else
				format.html{ render action: "new"}
			end	
		end
	end
end
