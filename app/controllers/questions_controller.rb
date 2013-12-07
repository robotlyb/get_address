#encoding: utf-8
class QuestionsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create]
	before_filter :rewrite_flag, only: [:new, :create, :index]
	before_filter :rewrite_plan_flag
	require 'debugger'
	def new
		@question = Question.new
		respond_to do |format|
			format.html
		end
	end
	def create
			
			@question = Question.new(params[:question])
			@question.user_id = current_user.id
			@question.visit = 0
			respond_to do |format|
				if @question.save
					flash[:notice] = "提问成功!请耐心等待达人们的回答～"
					format.html{redirect_to questions_show_url} 
				else
					flash[:notice] = "对不起，原谅我没记住问题。。再说一遍吧～"
					format.html{render action: 'new'}
				end
			end
	end
	def show 
		@question = Question.find(params[:id])
	  visit_question @question
		@answers = @question.answers.paginate(page: params[:page]) 
	end
	def index
		@question = Question.paginate(page: params[:page])
	end
end
