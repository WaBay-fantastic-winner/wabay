Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :projects do
    resources :comments, only: [:create, :index]
  end
  resources :comments
end
