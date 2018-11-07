class ResidencesController < ApplicationController
	def index
		@residences = Residence.all
	end

	def new
		@residence = Residence.new #crea formulario de una nueva residencia
	end

	def create #crea residencia
		@residence = Residence.new(params.require(:residence).permit(:name, :description)) #pasar mas parametros

		if @residence.save
			redirect_to residences_path, notice: 'Se creo la residencia correctamente'
		else
			render :new
		end
	end

	def destroy
		residence = Residence.find(params[:id])
		if residence.destroy
			redirect_to residences_path, notice: "La residencia fue eliminada"
		else
			redirect_to residences_path, notice: "La residencia no fue eliminada"	
		end


		
	end
end
