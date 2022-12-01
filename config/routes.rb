Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get '/compoments_pierre', to: "pages#compoments_pierre"

  resources :events, only: %i[index show new create] do
    resources :bookmarks, only: %i[create]
  end
  resources :bookmarks, only: %i[index destroy]
  resources :preferences, only: %i[show new create edit update destroy]
end
