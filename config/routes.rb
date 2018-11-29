Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'home/index'
	root to: "home#index"

	resources :residences #index new edit update destroy

	resources :auctions

	resources :users

	resources :reserves, only: [:new, :create]

	get '/wantPremium', to: 'users#wantPremium'

	get '/newReserve', to: 'reserves#newReserve' 

	get '/information', to: 'home#information' 

	get '/terms', to: 'home#terms'

	get '/showUser', to: 'users#showUser'

	get '/residencesPremium', to: 'residences#premium'

	get '/usersReserves', to: 'users#reserves'

	get '/usersResidences2', to: 'residences#updateUser'

	get '/updatePremium', to: 'users#updatePremium'

	get '/updateNormal', to: 'users#updateNormal'

end
