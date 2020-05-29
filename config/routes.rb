Rails.application.routes.draw do
  resources :flights, only: [:show, :index]
  resources :bookings, only: [:show, :new, :create]
  root "flights#index", search: {to: "YVR", from: "YVR", passenger_count: "2", date:""}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
