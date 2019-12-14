class AuctionsController < ApplicationController
	def index
		if current_user.admin == true
			@auctions = Auction.all
		else
			@auctions = current_user.inscriptions
		end
	end

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

		if @auction.bids.size != 0
			b = @auction.bids.first
			user = User.find(@auction.user_id)
			if user.credits > 0
				redirect_to destroyAuction_path(id: @auction.id)
			else
				win = @auction.bids.where("price < #{b.price}").first
				b.destroy
				@auction.update(user_id: win.user_id)
				redirect_to endAuction_path(id: @auction.id)
			end
		else
			redirect_to withoutWinner_path(id: @auction.id)
		end
	end

	def destroyAuction
		auction = Auction.find(params[:id])

		user = User.find(auction.user_id)
		if auction.destroy
			user.update(credits: user.credits-1)
			r = Reserve.new(user_id: user.id, residence_id: auction.residence_id, date: auction.date.to_date)
			r.save
			redirect_to root_path, notice: 'La subasta fue finalizada correctamente'
		else
			redirect_to auction_path(id: @auction.id), notice: 'ERROR: No pudo finalizar la subasta correctamente'
		end
	end

	def withoutWinner
		auction = Auction.find(params[:id])

		if auction.destroy
			redirect_to root_path, notice: "La subasta fue finalizada correctamente pero no hubo un ganador"
		else
			redirect_to auction_path(id: @auction.id), notice: 'ERROR: No pudo finalizar la subasta correctamente'
		end
	end

	private
end
