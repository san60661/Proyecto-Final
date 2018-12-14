class BidsController < ApplicationController
  	def new
		@auction = Auction.find(params[:id])
		@bid = Bid.new
	end

	def create
		@bid = Bid.new(params.require(:bid).permit(:user_id, :auction_id, :price))

		Auction.find(@bid.auction_id).update(actualPrice: @bid.price, user_id: @bid.user_id)
		if @bid.save
			redirect_to auction_path(id: @bid.auction_id), notice: "Se produjo la puja correctamente"
		else
			redirect_to root_path, notice: "ERROR al producir la puja"
		end
  	end
end
