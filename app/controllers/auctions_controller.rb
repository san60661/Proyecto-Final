class AuctionsController < ApplicationController
	def new
		@auction = Auction.new #crea formulario de una nueva subasta
	end

	def create #crea subasta
		@auction = Auction.new(params.require(:auction).permit(:date, :initPrice, :residence_id)) #pasar mas parametros

		if @auction.save
			redirect_to residences_path, notice: 'Se creo la subasta correctamente'
		else
			render :new
		end
	end

	def show
		@auction = Auction.find(params[:id])
	end

	private
end
