Rails.application.routes.draw do
  resources :variants
  resources :favorite_products, only: [:create, :destroy]

  # ----- admin -----
  devise_scope :admin do
    get 'sign-in', to: 'devise/sessions#new'
    get 'sign-up', to: 'devise/registrations#new', as: 'new_admin_registration'
  end
  devise_for :admins, controllers: {registrations: 'admins/registrations'}, defaults: { format: 'html' }
  resources :admins do
    resources :products
  end
  # ----- admin -----



  # ----- user -----
  devise_scope :user do
    get 'sign-in', to: 'devise/sessions#new'
    get 'sign-up', to: 'devise/registrations#new', as: 'new_user_registration'
  end
  devise_for :users
  resources :users do
    resources :products
    resources :reviews, except: [:show, :index]
  end
  # ----- user -----

  resources :products

  root    'static_pages#homepage'

  # redirects all unknown routes to homepage
  get '*path' => redirect('/')
end
