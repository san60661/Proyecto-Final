class UsersController < ApplicationController
	def residences
		@users = User.residences
	end

	private
	
end
