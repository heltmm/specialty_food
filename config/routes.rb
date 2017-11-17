Rails.application.routes.draw do
  devise_for :users

  get "about", to: "products#about"
  root :to => 'products#about'

  resources :products do
    resources :reviews
  end
end
