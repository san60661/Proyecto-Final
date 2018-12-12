class AuctionsController < ApplicationController
	def new
		@auction = Auction.new #crea formulario de una nueva subasta
	end

	def create #crea subasta
		@auction = Auction.new(params.require(:auction).permit(:initPrice, :date, :residence_id, :startDate))

		if @auction.save
			redirect_to auction_path(id: @auction.id), notice: 'Se creo la subasta correctamente'
		else
			redirect_to new_auction_path, notice: 'ERROR: Ya hay una subasta para esa residencia en esa semana'
		end
	end

	def show
		@auction = Auction.find(params[:id])
	end

	def endAuction
		@auction = Auction.find(params[:id])
	end

	private
end
