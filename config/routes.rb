Rails.application.routes.draw do
  
  devise_for :users
  
  get 'welcome/index'

  resources :docs do
    member do
      get :delete
    end
  end

  authenticated :user do
    root "docs#index", as: "authenticated_root"
  end

  root 'welcome#index'  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
