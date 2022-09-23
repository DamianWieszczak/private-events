Rails.application.routes.draw do
  root "events#index"

  get "home", to: "pages#home"

  devise_for :users
  resources :events do
    resources :attendees_events, only: [:new, :create, :destroy]
    member do
      get "join"
      get "leave"
    end
  end

  resources :users, only: [:show]
end
