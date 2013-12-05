class AnswersController < ApplicationController
	before_filter :signed_in_user
	def new 
		@answer =  Answer.new
	end

	def create
		@answer = Answer.new(params[:answer])
		@answer.user_id = current_user.id
		@answer.question_id = current_question.id		
		respond_to do |format|
			if @answer.save
				format.html{ redirect_to @answer.question}
			else
				format.html{ render action: "new"}
			end	
		end
	end
end
