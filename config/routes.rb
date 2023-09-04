Rails.application.routes.draw do


  # ----- user -----
  devise_scope :user do
    get 'sign-in', to: 'devise/sessions#new'
    get 'sign-up', to: 'devise/registrations#new', as: 'new_user_registration'
  end

  resources :users do
    resources :products
  end

  devise_for :users
  # ----- user -----

  resources :products

  root    'static_pages#homepage'

  # redirects all unknown routes to homepage
  get '*path' => redirect('/')
end
