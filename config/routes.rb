Rails.application.routes.draw do
  resources :products

  # ----- user -----
  devise_scope :user do
    get 'sign-in', to: 'devise/sessions#new'
    get 'sign-up', to: 'devise/registrations#new', as: 'new_user_registration'
  end
  devise_for :users
  resources :users do
    resources :products
  end
  # ----- user -----

  root    'static_pages#homepage'

  # redirects all unknown routes to homepage
  get '*path' => redirect('/')
end
