Rails.application.routes.draw do
  root 'links#new'

  resources :links
  #get '/links/new', to: 'links#new'
end
