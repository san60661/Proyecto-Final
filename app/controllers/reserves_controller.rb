class ReservesController < ApplicationController
	def index
		@reserves = current_user.reserves
	end
	
	def new
		@residence = Residence.find(params[:id])
		@reserve = Reserve.new 
	end

	def create
		@reserve = Reserve.new(params.require(:reserve).permit(:date, :user_id, :residence_id))

		if @reserve.save
			User.find(current_user.id).update(credits: current_user.credits-1)
			redirect_to reserves_path, notice: "Se confirmo la reserva correctamente"
		else
			redirect_to new_reserf_path(id: Residence.find(@reserve.residence_id).id), alert: "ERROR: La residencia ya está reservada en esa fecha"
		end
	end

	def destroy
		reserve = Reserve.find(params[:id])

		if reserve.destroy
			redirect_to reserves_path, notice: "Se canceló la reserva correctamente"
		else
			redirect_to reserves_path, notice: "ERROR al cancelar la reserva"	
		end	
	end

	private
end
