class ReservesController < ApplicationController
	def new
		@residence = Residence.find(params[:id])
		@reserve = Reserve.new
	end

	def create
		@reserve = Reserve.new(params.require(:reserve).permit(:date, :user_id, :residence_id))

		if @reserve.save
			redirect_to usersReserves_path, notice: "Se confirmo la reserva correctamente"
		else
			redirect_to residencesPremium_path, notice: "ERROR al confirmar la reserva"
		end
	end

	private
end
