#encoding: utf-8
class NotesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	require 'debugger'	
	def index

	end

	def create
		@note = current_user.notes.build(params[:note])
debugger		
		if @note.save
			flash[:success] = "发贴成功！"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def destroy

	end
	
end
