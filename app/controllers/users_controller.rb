class UsersController < ApplicationController
	def residences
	end

	def show
		@user = current_user
	end
	private
	
end
