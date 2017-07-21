Rails.application.routes.draw do
  resources :shops do
    resources :reviews
  end

  get 'random', to: 'shops#random'

  get 'search', to: 'shops#search'
  
  resources :reviews
end
