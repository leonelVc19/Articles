Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/bienvenida", to: "home#index"

  get "perfil", to: "users#edit"
  resources :users, only: [:update]

##ROOT PATH: 
  root to: "home#index"
  resources :categories
  resources :requests

  get "solicitudes", to: "requests#home_view"
  
  devise_for :users, :controllers => { Application: 'Application' }
  get "requests/user/:user_id", to: "requests#from_author_request"

  resources :articles do
    get "user/:user_id", to: "articles#from_author", on: :collection
    
  end
  #get "articles", to: "articles#index"
  #get "articles/new", to: "articles#new", as: :new_articles
  #get "articles/:id", to: "articles#show"
  #get "articles/:id/edit", to: "articles#edit"
  #patch "articles/:id", to: "articles#update", as: :article
  #post "articles", to: "articles#create"
  #delete "articles/:id", to: "articles#destroy"

end
