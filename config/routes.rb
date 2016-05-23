Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations
  namespace :api do
    resources :users, only: [:index, :show]
  end
  namespace :admin do
    resources :users, except: [:new, :create]
  end
end
