class UsersController < ApplicationController
	def residences
		u = User.find(1)
		u = User.residences
	end

	private
	
end
