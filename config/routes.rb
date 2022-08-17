Rails.application.routes.draw do
  resources :projects do
    resources :donate_items
  end
end
