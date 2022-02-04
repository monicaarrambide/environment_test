Rails.application.routes.draw do
  resources :user_items
  resources :users
  resources :items do
    member do
      get :delete
    end
  end
 
  root 'user_items#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
