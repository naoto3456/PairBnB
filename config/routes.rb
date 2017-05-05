  Rails.application.routes.draw do
  resources :listings do
    resources :reservations
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :edit, :update, :index] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
    resources :reservations, only: [:index]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  root "users#dashboad" 
  post "/listings/search" => "listings#search", as: "search_listing"
  get 'braintree/new'
  post 'braintree/checkout'

  # For details oin the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end