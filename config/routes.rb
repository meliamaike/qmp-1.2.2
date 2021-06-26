Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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


  get '/password', to: 'passwords#edit', as: :edit_password
  patch '/password', to: 'passwords#update'

  get 'password/reset', to:'password_resets#new'
  post 'password/reset', to:'password_resets#create'

  get 'password/reset/edit', to:'password_resets#edit'
  patch 'password/reset/edit', to:'password_resets#update'

end
