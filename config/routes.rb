Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :projects do
    resources :comments, shallow: true
<<<<<<< HEAD
  end
  namespace :api do
    resources :comments, only: [] do
      member do
        post :like
      end
    end
=======
>>>>>>> feature/comment
  end
end
