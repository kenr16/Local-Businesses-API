Rails.application.routes.draw do
  resources :shops do
    resources :reviews
  end

  # get 'reviews', to: 'reviews#index'

  resources :reviews
end
