Rails.application.routes.draw do
  root "events#index"
  get "home", to: "pages#home"

end
