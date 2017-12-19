Rails.application.routes.draw do

  resources :members, only: :show

  resources :submissions, only: [:create, :show] do
    resource :involvement, only: [:show, :update], controller: :involvement
    resource :distance, only: [:show, :update], controller: :distance
    resource :this_that, only: [:show, :update], path: 'concerns'
    resource :feelings, only: [:show, :update]
  end

  namespace :admin do
    root to: redirect('admin/members')
    resources :members, only: [:index, :create, :show]
  end

  resources :pages, only: :show
  root to: 'pages#index'
end
