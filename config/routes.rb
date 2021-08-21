Rails.application.routes.draw do
  resources :articles
  resources :categories
  resources :inquiries, only: [:new, :create]


  get      '/login',  to: 'sessions#new'
  post     '/login',  to: 'sessions#create'
  delete   '/logout', to: 'sessions#destroy'
  root 'forza#home'
  # get '/help',        to: 'forza#help'
  get '/news',        to: 'forza#news'
  # get '/contact',     to: 'forza#contact'
  get '/about',       to: 'forza#about'

  namespace :articles do 
    resources :searches, only: :index, defaults: { format: :json }
  end

  

end
