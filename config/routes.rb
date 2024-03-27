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
    resources :orders
    member do
      get 'dashboard'
      get 'customers'
      get 'product'
      get 'variant'
      get 'listed-orders'
    end
  end
  # ----- admin -----
  
  # ----- user -----
  devise_scope :user do
    get 'sign-in', to: 'devise/sessions#new'
    get 'sign-up', to: 'devise/registrations#new', as: 'new_user_registration'
  end
  devise_for :users
  resources :users do
    resources :reviews, except: [:show, :index]
    member do
      get 'dashboard'
    end
  end
  # ----- user -----

  # ----- new-cart -----
  namespace :carts do
    resource :add, only: :create
    resource :remove, only: :destroy
  end
  # ----- new-cart -----

  # ----- checkout -----
  resource :checkout, only: :show
  # ----- checkout -----

  resources :products

  root    'static_pages#homepage'






  # ----- cart -----
  get 'cart', to: 'carts#show'
  # ----- cart -----

  # ----- checkout -----
  post 'webhooks' => 'webhooks#stripe'
  post 'checkout', to: 'checkouts#create'
  get 'success', to: 'checkouts#success'
  get 'cancel', to: 'checkouts#cancel'
  # ----- checkout -----


  # redirects all unknown routes to homepage
  get '*path' => redirect('/')
end
