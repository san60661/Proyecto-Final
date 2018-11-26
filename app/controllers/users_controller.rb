class UsersController < ApplicationController
	def residences
	end

	def index
		@users = User.all
	end

	def show
		@user = current_user
	end
	private
	
end
