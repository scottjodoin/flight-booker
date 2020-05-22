Rails.application.routes.draw do
  resources :passengers
  resources :flights
  devise_for :users
  root "flights#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
