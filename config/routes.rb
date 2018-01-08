Rails.application.routes.draw do

  resources :members, only: [:show, :new, :create]

  resources :submissions, only: [:create, :show] do
    resource :involvement, only: [:show, :update], controller: :involvement
    resource :distance, only: [:show, :update], controller: :distance
    resource :activities, only: [:show, :update, :new, :create]
    resource :postcode, only: [:show, :update], controller: :postcode
  end

  namespace :admin do
    root to: redirect('admin/members')
    resources :members, only: [:index, :create, :show]
    resources :activities, only: [:show]
  end

  resources :pages, only: :show
  root to: 'pages#index'
end
