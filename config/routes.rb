Rails.application.routes.draw do
  resources :auths, only: [:create]
  resources :kiinds
  resources :contacts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
