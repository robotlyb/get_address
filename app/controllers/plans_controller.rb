#encoding: utf-8
class PlansController < ApplicationController

	before_filter :signed_in_user
  before_filter :rewrite_flag
	before_filter :rewrite_plan_flag, only: [:new, :create, :index]
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
		respond_to do |format|
			if @plan.save
				flash[:notice] = "分享成功！"
				format.html{redirect_to show_all_plan_url}
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
	end
end
