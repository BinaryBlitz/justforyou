Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations

  namespace :api do
    resources :users, only: [:index, :show, :update, :destroy]
    resources :programs, except: [:new, :edit]
  end

  namespace :admin do
    resources :users, except: [:new, :create]
    resources :programs, except: [:new]
  end
end
