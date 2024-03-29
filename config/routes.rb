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

  # ----- cart -----
  namespace :carts do
    resource :add, only: :create
    resource :reduce, only: :create
    resource :remove, only: :destroy
  end
  # ----- cart -----

  # ----- webhook -----
  scope module: :stripe_event do
    post "/stripe/webhook", to: "webhook#event"
  end
  # ----- webhook -----

  # ----- checkout -----
  resource :checkout, only: [:show, :create] do
    resource :payment, only: :show
  end
  # ----- checkout -----

  # ----- search -----
  post :search, to: "searches#show"
  # ----- search -----

  resources :products
  root    'static_pages#homepage'






  # ----- old-checkout -----
  # post 'webhooks' => 'webhooks#stripe'
  # post 'checkout', to: 'checkouts#create'
  get 'success', to: 'checkouts#success'
  get 'cancel', to: 'checkouts#cancel'
  # ----- old-checkout -----


  # redirects all unknown routes to homepage
  get '*path' => redirect('/')
end
