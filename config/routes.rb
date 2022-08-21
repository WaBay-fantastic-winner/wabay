Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resource :projects do
    collection do
      get :proposal, :organizers
    end
  end
end
