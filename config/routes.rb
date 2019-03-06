Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :products
  resources :carts, only: [:show, :create, :update] do
    resources :charges
  end

  resources :products do
    resources :avatars, only: [:create]
  end
  get 'home/users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  get 'home/admin_dashboard', as: "admin"
end
