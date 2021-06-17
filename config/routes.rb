Rails.application.routes.draw do
  root 'forza#home'
  get '/help', to: 'forza#help'
  get '/blog', to: 'forza#blog'
  get '/contact', to: 'forza#contact'
  get '/about', to: 'forza#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
