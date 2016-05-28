Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  devise_scope :admin do
    get "/admin", to: "devise/sessions#new"
  end

  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resources :users, only: [:index, :show, :update]
    resources :blocks, only: [:index, :show] do
      resources :programs, only: [:index, :show, :update]
    end
    resources :orders, except: [:new, :edit]
    resources :addresses, only: [:create, :index, :show]
  end

  namespace :admin do
    resources :users, except: [:new, :create]
    resources :programs, except: [:new]
  end
end
