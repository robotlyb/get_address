module PlansHelper
	
	def visit_plan(plan)
		plan.visit = 1
		plan.save
		self.current_plan = plan
	end

	def current_plan=(plan)
		@current_plan = plan
	end

	def current_plan
		token = 1
		@current_plan ||= Plan.find_by_visit(token)
	end	

	def end_visit(plan)
		plan.visit = 0
		plan.save
	end

	def rewrite_plan_flag
		if(current_plan)
			end_visit current_plan
		end
	end
	
end
