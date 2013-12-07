class StaticPagesController < ApplicationController
	def home
		rewrite_flag
		rewrite_plan_flag
	end

  def help
  end

  def about
  end

  def contact
  end
end
