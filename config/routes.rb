Rails.application.routes.draw do
  resources :favorite_products, only: [:create, :destroy]

  # ----- user -----
  devise_scope :user do
    get 'sign-in', to: 'devise/sessions#new'
    get 'sign-up', to: 'devise/registrations#new', as: 'new_user_registration'
  end
  devise_for :users
  resources :users do
    resources :products
    resources :reviews
  end
  # ----- user -----

  resources :products

  root    'static_pages#homepage'

  # redirects all unknown routes to homepage
  get '*path' => redirect('/')
end
