class HotsalesController < ApplicationController
	def index
		@hotsales = Hotsale.all
	end


	def new
		@hotsale = Hotsale.new

	end


	def create
	
		@hotsale = Hotsale.new(params.require(:hotsale).permit(:price, :date, :residence_id, :description))
		if Reserve.where(residence: @hotsale.residence_id, date: @hotsale.date).exists?
			redirect_to new_hotsale_path, notice: 'Ya hay un Hot Sale para esa residencia en esa fecha'

		else
			@hotsale.save
			redirect_to root_path, notice: 'Se creo el Hot Sale correctamente'
		
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

	def show
		@hotsale = Hotsale.find(params[:id])
		@residence = Residence.find(@hotsale.residence_id)
	end

	def reserveHotSale
		hotsale = Hotsale.find(params[:id])
		user = User.find(current_user.id)
		residence = Residence.find(hotsale.residence_id)
		if hotsale.destroy
			r = Reserve.new(user_id: user.id, residence_id: residence.id, date: hotsale.date)
			r.save
			redirect_to root_path, notice: 'La reserva se hizo correctamente'
		else
			redirect_to hotsale_path(id: hotsale.id), notice: 'ERROR: No pudo reservarse correctamente'
		end
	end

end
