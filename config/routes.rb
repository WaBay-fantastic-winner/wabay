Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :projects do
    resources :comments, shallow: true, only: [:create, :destroy]
  end
end
