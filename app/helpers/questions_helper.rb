module QuestionsHelper
	def current_question
		token = Question.encrypt(cookies[:token])
		@current_question ||= Question.find_by_token(token)
	end
end
