Rails.application.routes.draw do
  get 'urls/index'
  get 'urls/new'
	root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/sessions/new', to: 'static_pages#home'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  resources :users
  # resources :urls, only: [:index, :create]
  resources :urls
  # get 'urls/index'
  # post 'urls/create'
  get ':short_url', to: 'urls#show'
  get '/urls/:short_url', to: 'urls#show'
end
