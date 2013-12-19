#encoding: utf-8
class PlansController < ApplicationController
require 'debugger'
	before_filter :signed_in_user
  before_filter :rewrite_flag
	before_filter :rewrite_plan_flag, only: [:new, :create, :index,:search_plan,:show_search_plan]
	def new
		@plan = Plan.new
		respond_to do |format|
			format.html
		end	
	end

	def create
		
		@plan = Plan.new(params[:plan])
		@plan.user_id = current_user.id
		@plan.visit = 0
		@plan.avarage_score = 0.0
		respond_to do |format|
			if @plan.save
				flash[:notice] = "分享成功！"
				format.html{redirect_to show_all_plans_url}
			else	
				flash[:notice] = "出错了。。"
				format.html{render action: 'new'}
			end	
		end
	end
 def index
	@plan = Plan.paginate(page: params[:page])
 end
	def show
		@plan = Plan.find(params[:id])
		visit_plan @plan
		@comments = @plan.comments.paginate(page: params[:page])
		if @plan.comments.any?
			score = 0.0
			@comments.each do |c|
				score += c.score
			end
			@plan.avarage_score = (score / @plan.comments.count).round(2)
		end
	end
	

	def show_search_result
		key_word = current_user.searches.last!.key
		len = key_word.length
		i = 0
		keyword = key_word.split("")
		
		condition = ""
		while i<(len-1) do
			condition += "gender LIKE '%#{keyword[i]}%' OR situation LIKE '%#{keyword[i]}%' OR title LIKE '%#{keyword[i]}%' OR color LIKE '%#{keyword[i]}%' OR "
			i += 1
		end
		keyword[len-1].force_encoding("utf-8")
		condition += "gender LIKE '%#{keyword[len-1]}%' OR situation LIKE '%#{keyword[len-1]}%' OR title LIKE '%#{keyword[len-1]}%' OR color LIKE '%#{keyword[len-1]}%'"
		succ = condition.to_s	
		@plans = Plan.where("#{succ}")
			
	end
end
