Rails.application.routes.draw do
  resources :listings
  resources :hero_images
  devise_for :users
  root "listings#index"
end
