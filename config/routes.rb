Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :projects do
    resources :donate_items
    resource :disclosures, only: [:show]
    resources :comments, shallow: true
  end

  namespace :api do
    namespace :v1 do
      resource :project, only: [] do
        get :progress_bar
      end
    end

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
