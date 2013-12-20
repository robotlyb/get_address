#encoding: utf-8
class StaticPagesController < ApplicationController
require 'debugger'
	before_filter :rewrite_flag
	before_filter :rewrite_user_flag
	before_filter :rewrite_plan_flag
	def home
		@plan = all_plan
		@search = current_user.searches.build if signed_in?
	end

  def help
  end

  def about
  end

  def contact
  end
end
