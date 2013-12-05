module QuestionsHelper
require 'debugger'
	def visit_question(question)
		question.visit = 1
		question.save
		self.current_question = question
	end

	def current_question=(question)
		@current_question = question
	end

	def current_question
		token = 1
		@current_question ||= Question.find_by_visit(token)
	end

	def end_visit(question)
		question.visit = 0
		question.save
	end
	def rewrite_flag
		if(current_question)
			end_visit current_question
		end
	end
end
