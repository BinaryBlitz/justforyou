Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  namespace :api do
    resources :users, only: [:index, :show, :update]
    resources :programs, only: [:index, :show, :update]
  end

  namespace :admin do
    resources :users, except: [:new, :create]
    resources :programs, except: [:new]
  end
end
