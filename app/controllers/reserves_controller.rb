class ReservesController < ApplicationController
	def new
		@residence = Residence.find(params[:id])
		@reserve = Reserve.new
	end

	def create
		@reserve = Reserve.new(params.permit(:user_id, :residence_id))

		if @reserve.save
			redirect_to usersResidences_path, notice: "Se confirmo la reserva correctamente"
		else
			redirect_to residencesPremium_path, notice: "ERROR al confirmar la reserva"
		end
	end

	private
end
