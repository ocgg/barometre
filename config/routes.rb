Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get '/admin', to: 'admin_pages#admin_home'
  get '/admin/events', to: 'admin_pages#admin_events'
  get '/admin/venues', to: 'admin_pages#admin_venues'

  get '/map', to: 'events#map', as: :map
  get '/filter', to: 'events#filter', as: :filter
  post '/filter', to: 'events#apply'

  resources :venues, only: %i[index]
  resources :venues, only: %i[new create] do
    resources :events, only: %i[new create]
  end
  resources :events, only: %i[index show edit update destroy] do
    resources :bookmarks, only: %i[create]
    resources :tags, only: %i[new create]
  end
  resources :bookmarks, only: %i[index destroy]
  resources :preferences, only: %i[show new create edit update destroy]
end
