class UsersController < ApplicationController
	def index
		@residences = Residence.all
	end

	def show
		@residence = Residence.find(params[:id])
	end

	private
	
end
