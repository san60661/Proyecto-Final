class UsersController < ApplicationController
	def residences
		u = User.create(name: "Santiago", category:"Premium")
		u = User.residences
	end

	private
	
end
