Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  get "home", to: "pages#home"

end
