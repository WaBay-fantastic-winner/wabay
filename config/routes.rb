Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callback" } 
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/profile', to: 'users/registrations#profile'
  end
  
  get '/users/projects/:id', to: 'projects#show'
  resources :projects do
    resources :donate_items
    member do
      post :follow
    end
    resource :disclosures, only: [:show]
    resources :comments, shallow: true
    resources :questions, shallow: true, except: [:show]
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
