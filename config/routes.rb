Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  devise_scope :admin do
    get '/admin', to: 'devise/sessions#new'
  end

  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user, only: [:show, :create, :update]

    resources :addresses, except: [:new, :edit, :update]
    resources :payments, only: [:index]

    resources :orders, except: [:new, :edit] do
      resource :payment, only: [:create]
    end

    resources :blocks, only: [:index, :show] do
      resources :programs, only: [:index, :show]
    end

    resources :product_types, only: [:index, :show]
    resources :substitutions, only: [:index]
    resources :products, only: [:index, :show] do
      resources :substitutions, only: [:create, :destroy], shallow: true
    end

    resources :programs, only: [:index, :show] do
      resources :days, only: [:index]
    end

    resources :days, only: :show do
      resources :items, only: :index
    end

    resources :deliveries, only: :cancel do
      patch 'cancel', on: :member
    end

    resources :promotions, only: [:index, :show]

    resources :payment_cards, only: [:index, :create, :destroy]

    resources :deliveries, only: :index

    resources :purchases, only: :index do
      resources :deliveries, only: [:create]
    end
  end

  namespace :admin do
    resources :users, except: [:new, :create]

    resources :programs do
      resources :days, shallow: true
    end

    resources :blocks
    resources :promotions

    resources :deliveries, only: :cancel do
      patch 'cancel', on: :member
    end

    resources :managers

    resources :orders, only: :show
    
    resources :exports, only: [] do
      get 'kitchen', on: :collection
      get 'courier', on: :collection
      get 'manager', on: :collection
    end
  end

  resources :payments, only: [] do
    post 'success', 'fail', on: :collection
  end
end
