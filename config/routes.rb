Rails.application.routes.draw do
  devise_for :users
  root to: "shops#index"
  get 'shops/search'
  resources :shops do
    resources :reviews, only: :create
  end
  namespace :admin do
    resources :admin_shops
  end
end
