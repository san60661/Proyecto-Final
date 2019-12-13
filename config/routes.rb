Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'home/index'
	root to: "home#index"

	resources :residences #index new edit update destroy

	resources :auctions

	resources :users

	resources :reserves

	resources :inscriptions, only: [:new, :create]

	resources :bids

	resources :hotsales

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

	get '/updateAdmin', to: 'users#updateAdmin'

	get '/outAdmin', to: 'users#outAdmin'

	get '/indexAdmin', to: 'users#indexAdmin'

	get '/logicalDelete', to: 'residences#logicalDelete'

	get '/logicalUpdate', to: 'residences#logicalUpdate'

	get '/endAuction', to: 'auctions#endAuction'

	get '/destroyAuction', to: 'auctions#destroyAuction'

	get '/reserveHotSale', to: 'hotsales#reserveHotSale'

	get '/withoutWinner', to: 'auctions#withoutWinner'
end
