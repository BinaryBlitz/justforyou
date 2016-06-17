Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  devise_scope :admin do
    get '/admin', to: 'devise/sessions#new'
  end

  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user, only: [:show, :create, :update]

    resources :addresses, except: [:new, :edit, :update]
    resources :product_types, only: [:index, :show]
    resources :payments, only: [:index]

    resources :orders, except: [:new, :edit] do
      resource :payment, only: [:create]
    end

    resources :blocks, only: [:index, :show] do
      resources :programs, only: [:index, :show]
    end

    resources :products, only: [:show] do
      resources :substitutions, only: [:index, :create, :destroy], shallow: true
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

    resources :purchases, only: :index
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
  end

  resources :payments, only: [] do
    post 'success', 'fail', on: :collection
  end
end
