class UsersController < ApplicationController
	def residences
		@user = User.residences
	end

	private
	
end
