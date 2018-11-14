Rails.application.routes.draw do

  resources :residences #index new edit update destroy

  resources :users
  
end
