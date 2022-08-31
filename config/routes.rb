Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :projects do
    resources :donate_items
  end

  resources :transactions, except: [:show, :edit, :update] do
    collection do
      post :paid
    end
  end
end
