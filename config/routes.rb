Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get '/compoments_pierre', to: "pages#compoments_pierre"

  get '/components_olive', to: 'pages#components_olive'
  get '/map', to: 'events#map', as: :map
  resources :events, only: %i[index show new create] do
    resources :bookmarks, only: %i[create]
  end
  resources :bookmarks, only: %i[index destroy]
  resources :preferences, only: %i[show new create edit update destroy]
  get "/sewan", to: "pages#sewan"
end
