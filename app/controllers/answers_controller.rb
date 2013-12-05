#encoding: utf-8
class AnswersController < ApplicationController
	before_filter :signed_in_user
	require 'debugger'
	def new 
		@answer =  Answer.new
	end

	def create
		@answer = Answer.new(params[:answer])
		@answer.user_id = current_user.id
		@answer.question_id = current_question.id		
		respond_to do |format|
			if (!(@answer.clothes_url || @answer.pants_url || @answer.shoes_url || @answer.other_dress))
					format.html{ render action: "new"}
					flash[:notice] = "所有建议都为空，你是不是忘了填什么？"
			elsif @answer.save
				format.html{ redirect_to @answer.question}
			else
				format.html{ render action: "new"}
			end	
		end
	end
end
