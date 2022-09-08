Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :projects do
    resources :donate_items
    resource :disclosures, only: [:show]
    collection do
      get :percentage
    end

    resources :comments, shallow: true
    
  end
  namespace :api do
    resources :comments, only: [] do
      member do
        post :like
      end
    end
  end

  resources :transactions, except: [:show, :edit, :update] do
    collection do
      post :paid
    end
  end
end
