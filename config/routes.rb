Rails.application.routes.draw do
  root 'links#new'

  resources :links
  resources :users
  resources :sessions

  get ':code', to: 'links#go'
  get '/links/:id/users', to: 'links#users'
  get '/links/:id/user_counts', to: 'links#user_counts'

  # authentication
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
