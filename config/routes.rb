Rails.application.routes.draw do

  concern :api_base do
    resources :shops do
      resources :reviews
    end

    get 'random', to: 'shops#random'
    get 'search', to: 'shops#search'
    resources :reviews
  end

  namespace :v1 do
    concerns :api_base
  end




end
