Rails.application.routes.draw do
  resources :shops do
    resources :reviews
  end

  get 'reviews', to: 'reviews#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
