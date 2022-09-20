Rails.application.routes.draw do
  root "events#index"
  devise_for :users
  resources :users, only: [:index, :show]
  get "home", to: "pages#home"

end
