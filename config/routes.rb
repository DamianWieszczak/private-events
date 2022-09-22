Rails.application.routes.draw do
  root "events#index"

  get "home", to: "pages#home"

  devise_for :users
  resources :users, only: [:index, :show]
  resources :events, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  resources :invitations, only: [:index, :show, :create, :new, :destroy, :update] 
end
