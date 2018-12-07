class UsersController < ApplicationController
	def residences
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def showUser
		@user = current_user
	end

	def destroy
		user = User.find(params[:id])
		if user.destroy
			redirect_to users_path, notice: "El usuario '#{user.email}' fue eliminado correctamente."
		else
			redirect_to users_path, notice: "ERROR al eliminar el usuario '#{user.email}'"	
		end	
	end

	def updatePremium
		@user = User.find(params[:id])

		if @user.update(premium: true)
			redirect_to users_path, notice: 'El usuario ahora es Premium'
		else
			redirect_to users_path, notice: 'ERROR al pasar el usuario a Premium'
		end
	end

	def updateAdmin
		@user = User.find(params[:id])
		if @user.update(admin: true)
			redirect_to users_path, notice: 'El usuario ahora es admin'
		else
			redirect_to users_path, notice: 'ERROR al pasar el usuario a admin'
		end
	end

	def outAdmin
		@user = User.find(params[:id])
		if @user.update(admin: false)
			redirect_to users_path, notice: 'El usuario ya no es administrador'
		else
			redirect_to users_path, notice: 'ERROR al dar de baja al administrador'
		end
	end

	def updateNormal
		@user = User.find(params[:id])

		if @user.update(premium: false)
			redirect_to users_path, notice: 'El usuario ahora es Normal'
		else
			redirect_to users_path, notice: 'ERROR al pasar el usuario a Normal'
		end
	end

	def wantPremium
		redirect_to showUser_path, notice: 'Su solicitud fue enviada correctamente. Debe acercarse a las oficinas para completar el cambio a usuario premium'
	end

	def indexAdmin
		@users = User.all
	end

	
	private
	
end
