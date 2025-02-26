Rails.application.routes.draw do
  resources :listings
  devise_for :users
  root "listings#index"

  # Exclude requests for static files
  match "*unmatched", to: "application#not_found", via: :all, constraints: lambda { |req|
    req.path.exclude?("/assets/") && req.path.exclude?("/packs/") && req.path.exclude?("/favicon.ico") && req.path.exclude?("/robots.txt")
  }
end
