Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  devise_scope :admin do
    get '/admin', to: 'devise/sessions#new'
  end

  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user, only: [:show, :create, :update]

    resources :addresses, except: [:new, :edit, :update]
    resources :payments, only: [:index, :show]

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

    resources :delivery_invoices, only: [:create] do
      resource :payment, only: [:create]
    end

    resources :promotions, only: [:index, :show]

    resources :payment_cards, only: [:index, :create, :destroy]

    resources :deliveries, only: :index

    resources :purchases, only: :index do
      resources :deliveries, only: [:create]
      resources :exchanges, only: [:create]
    end

    resources :exchanges, only: [] do
      resource :payment, only: [:create]
    end
  end

  namespace :admin do
    resources :users, except: [:new, :create]

    resources :programs do
      resources :days, shallow: true
    end

    resources :blocks
    resources :promotions

    resources :product_types, except: [:show] do
      resources :products, except: [:show], shallow: true
    end

    resources :deliveries, only: :cancel do
      patch 'cancel', on: :member
    end

    resources :managers

    resources :orders, only: [:index, :show]

    resources :exports, only: [:new, :create]

    resources :configurables, only: [:index]
  end

  resources :payments, only: [] do
    post 'success', 'fail', on: :collection
  end
end
