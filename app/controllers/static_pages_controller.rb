class StaticPagesController < ApplicationController
  def home
		@note = current_user.notes.build if signed_in?
	end

  def help
  end

  def about
  end

  def contact
  end
end
