Rails.application.routes.draw do
  devise_for :users
  root to: "shops#index"
  get 'search', to: 'shops#search'
  resources :shops do
    resources :reservations, only: [:new, :create]
    resources :reviews, only: :create
  end
  namespace :admin do
    resources :admin_shops
  end
end
