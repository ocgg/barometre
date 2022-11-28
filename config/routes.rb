Rails.application.routes.draw do
  get 'bookmarks/index'
  get 'bookmarks/show'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'preferences/show'
  get 'preferences/new'
  get 'preferences/create'
  get 'preferences/edit'
  get 'preferences/update'
  get 'preferences/destroy'
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/create'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
