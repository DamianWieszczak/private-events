Rails.application.routes.draw do
  root "events#index"

  get "home", to: "pages#home"

  devise_for :users
  resources :users, only: [:index, :show]
  resources :events  

end
