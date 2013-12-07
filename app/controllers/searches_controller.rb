#encoding: utf-8
class SearchesController < ApplicationController
require 'debugger'
	def create
		@search = current_user.searches.build
		@search.key = params["search"]["key"]
		@search.user_id = current_user.id
		
				if @search.save
				 redirect_to show_search_plan_url
				else
					flash[:notice] = "没有输入查询条件"
					render 'static_pages/home' 
				end
				
	end

	private
		def search_params
			params.require(:search).permit(:key)
		end
end
