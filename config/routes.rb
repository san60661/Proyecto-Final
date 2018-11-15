Rails.application.routes.draw do

  resources :residences #index new edit update destroy

  resources :users

  get '/residencesPremium', to: 'residences#premium'

  get '/usersResidences', to: 'users#residences'

  get '/usersResidences2', to: 'residences#updateUser'

  root 'residences#default'
end
