Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  devise_scope :admin do
    get '/admin', to: 'devise/sessions#new'
  end

  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user, only: [:show, :create, :update]

    resources :orders, except: [:new, :edit]
    resources :addresses, except: [:new, :edit, :update]
    resources :product_types, only: [:index, :show]

    resources :blocks, only: [:index, :show] do
      resources :programs, only: [:index, :show, :update]
    end

    resources :products, only: [:show] do
      resources :substitutions, only: [:index, :create, :destroy], shallow: true
    end

    resources :programs, only: [:index, :show, :update] do
      resources :days, only: [:index]
    end

    resources :days, only: :show do
      resources :items, only: :index
    end

    resources :deliveries, only: :cancel do
      patch 'cancel', on: :member
    end

    resources :promotions, only: [:index, :show]
  end

  namespace :admin do
    resources :users, except: [:new, :create]
    resources :programs
    resources :blocks
  end
end
