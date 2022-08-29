Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :projects do
    resources :donate_items
  end

  resources :transactions, except: [:index, :show, :edit, :update] do
    collection do
      get :ecpay
    end
  end
end
