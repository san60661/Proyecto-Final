class ResidencesController < ApplicationController
	def index
		@residences = Residence.all
	end

	def new
		@residence = Residence.new #crea formulario de una nueva residencia
	end

	def create #crea residencia
		@residence = Residence.new(residence_params) #pasar mas parametros

		if @residence.save
			redirect_to residences_path, notice: 'Se creo la residencia correctamente'
		else
			render :new
		end
	end

	def edit
		@residence = Residence.find(params[:id])
	end

	def update
		@residence = Residence.find(params[:id])

		if @residence.update(residence_params) #pasar mas parametros
			redirect_to residences_path, notice: 'Se edito la residencia correctamente'
		else
			render :edit
		end
	end

	def destroy
		residence = Residence.find(params[:id])
		if residence.destroy
			redirect_to residences_path, notice: "La residencia '#{residence.name}' fue eliminada correctamente."
		else
			redirect_to residences_path, notice: "ERROR al eliminar la residencia '#{residence.name}'"	
		end	
	end

	def show
		@residence = Residence.find(params[:id])
	end

	private

	def residence_params
		params.require(:residence).permit(:name, :description, :price, :location)
	end
end
