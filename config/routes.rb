Rails.application.routes.draw do
  root 'links#new'

  resources :links

  get ':code', to: 'links#go'
  get '/links/:id/users', to: 'links#users'
end
