Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :events, only: %i[index show new create]
  resources :bookmarks, only: %i[index show create destroy]
  resources :preferences, only: %i[show new create edit update destroy]
end
