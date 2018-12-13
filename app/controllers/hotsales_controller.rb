class HotsalesController < ApplicationController
	def index
		@hotsales = Hotsales.all
	end


	def new
		@hotsale = Hotsale.new

	end


	def create
	
	@hotsale = Hotsale.new(hotsale_params)

		if @hotsale.save
			redirect_to hotsales_path, notice: 'Se creo el Hot Sale correctamente'
		else
			render :new
		end

	end

	def destroy
		hotsale = Residence.find(params[:id])
		if hotsale.destroy
			redirect_to hotsales_path, notice: "El hotsale de la residencia '#{hotsale.residence.name}' fue eliminado correctamente."
		else
			redirect_to hotsales_path, notice: "ERROR al eliminar la residencia '#{hotsale.residence.name}'"	
		end	
	end

end
