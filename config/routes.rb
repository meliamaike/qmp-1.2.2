Rails.application.routes.draw do
  root to: 'home#index'
  resources :prendas

  resources :guardarropas do
    resources :atuendos
    get 'atuendos-generate', to: 'atuendos#generate'
  end
end
