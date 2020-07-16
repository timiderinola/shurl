Rails.application.routes.draw do
	root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/sessions/new', to: 'static_pages#home'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
