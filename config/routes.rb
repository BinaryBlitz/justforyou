Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations
  namespace :api do
<<<<<<< HEAD
    resources :users, only: [:index, :show, :update, :destroy]
  end
  namespace :admin do
    resources :users, except: [:new, :create]
=======
    resources :users, only: [:index, :show]
  end
  namespace :admin do
    resources :users, only: [:index, :show]
>>>>>>> master
  end
end
