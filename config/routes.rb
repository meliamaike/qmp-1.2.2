Rails.application.routes.draw do
  resources :users

  root to: 'home#index'

  resources :prendas

  resources :guardarropas do
    resources :atuendos
    get '/atuendos-generate', to: 'atuendos#generate'

  end

   get '/login', to: 'sessions#new'
   post '/sessions', to: 'sessions#create'
   get '/logout', to: 'sessions#destroy'


  get '/profile', to: 'sessions#profile'

end
