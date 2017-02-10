Rails.application.routes.draw do
  get 'sessions/new'

  root 'links#new'

  resources :links
  resources :users
  resources :sessions

  get ':code', to: 'links#go'
  get '/links/:id/users', to: 'links#users'

  # authentication
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
