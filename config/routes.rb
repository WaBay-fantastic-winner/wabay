Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :projects do
    resources :donate_items

  resources :projects, only: [] do
    collection do
      get :search
      #關鍵字搜尋
      get :week_hot
      #本週熱門
      get :recently_launched
      #最新上線
      get :recently_ending
      #本週熱門即將結束
      get :all
      #全部專案
    end
>>>>>>> homepageErb
  end
end
