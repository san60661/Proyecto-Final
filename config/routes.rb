Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
	root to: "home#index"

	resources :residences #index new edit update destroy

	# resources :users, only: [:show]

	get '/showUser', to: 'users#show'

	get '/residencesPremium', to: 'residences#premium'

	get '/usersResidences', to: 'users#residences'

	get '/usersResidences2', to: 'residences#updateUser'
end
