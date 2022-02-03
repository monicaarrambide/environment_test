Rails.application.routes.draw do
  resources :items do
    member do
      get :delete
    end
  end
 
  root 'items#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
