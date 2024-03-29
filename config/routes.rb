Rails.application.routes.draw do
  devise_for :users

  # root to: "pages#home"
  root to: "events#index" # En attendant que la homepage ait une utilité

  get '/contact', to: 'pages#contact'
  post '/send_contact_mail', to: 'pages#send_contact_mail'

  get '/map', to: 'events#map', as: :map

  get '/filter', to: 'events#filter', as: :filter
  post '/filter', to: 'events#apply'

  resources :venues, only: %i[index]
  resources :venues, only: %i[new create edit update] do
    resources :events, only: %i[new create]
  end
  resources :events, only: %i[index show edit update destroy] do
    resources :bookmarks, only: %i[create]
    resources :tags, only: %i[new create edit update]
  end
  resources :bookmarks, only: %i[index destroy]
  resources :preferences, only: %i[show new create edit update destroy]

  # Admin routes
  get '/admin', to: 'admin_pages#admin_home'
  get '/admin/events', to: 'admin_pages#admin_events'
  get '/admin/venues', to: 'admin_pages#admin_venues'
  patch '/admin/events/:id', to: 'admin_pages#event_confirm', as: :event_confirm
  delete '/admin/events/:id', to: 'admin_pages#event_reject', as: :event_reject
  patch '/admin/venues/:id', to: 'admin_pages#venue_confirm', as: :venue_confirm
  delete '/admin/venues/:id', to: 'admin_pages#venue_reject', as: :venue_reject
end
