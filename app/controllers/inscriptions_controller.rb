class InscriptionsController < ApplicationController
    def new
		@residence = Residence.find(params[:id])
		@inscription = Inscription.new
	end

	def create
		@inscription = Inscription.new(params.require(:inscription).permit(:date, :user_id, :auction_id))

		if @inscription.save
			redirect_to residences_path, notice: "Se inscribio a la subasta correctamente"
		else
			redirect_to residences_path, notice: "ERROR ya esta inscripto en esa subasta"
		end
  	end
    
    private
end
