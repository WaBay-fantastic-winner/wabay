Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :projects do
    resources :donate_items
    member do
      post :follow
    end
    resource :disclosures, only: [:show]
    resources :comments, shallow: true
  end

  namespace :api do
    resources :comments, only: [] do
      member do
        post :like
      end
    end
    resource :search, only: [] do 
      collection do
        get :projects
      end 
    end
  end

  resources :follows, only: [:index] 


  resources :transactions, except: [:show, :edit, :update] do
    collection do
      post :paid
    end
  end
end
