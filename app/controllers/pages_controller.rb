class PagesController < ApplicationController
	def index
		unless user_signed_in?
			redirect_to new_user_session_path
		end

	end

	def about

	end

	def contact

	end

end