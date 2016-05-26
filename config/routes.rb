Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  namespace :api do
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
