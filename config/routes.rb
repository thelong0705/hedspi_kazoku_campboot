Rails.application.routes.draw do
  get 'replies/show'
  get 'replies/create'
  get 'replies/update'
  get 'replies/delete'
  devise_for :admins, skip: [:registrations], controllers: {sessions: "admins/sessions"}
  ActiveAdmin.routes(self)

  resources :comments do
    resources :replies, only: [:create, :show, :update, :destroy, :index]
  end

  resources :companies, only: [:show, :index] do
    member do
      put 'like' => 'companies#like'
    end
    collection do
      match 'search' => 'companies#search', :via => [:get, :post], :as => :search
    end
    resources :reviews, only: [:index, :show, :create, :destroy]
  end

  put '/replies/:id', to: 'replies#update'
  delete '/replies/:id', to: 'replies#destroy'

  root 'static_pages#home'

  devise_for :users,
             skip: [:registrations], controllers: {sessions: "users/sessions"}

  devise_scope :user do
    get 'users/sign_up', to: 'users/registrations#new', as: :new_user_registration
    post 'users/sign_up', to: 'users/registrations#create', as: :user_registration
    get 'users/edit', to: 'users/registrations#edit', as: :edit_user
    put 'users/sign_up', to: 'users/registrations#update'
  end

  resources :users, only: [:show]
  resources :compensations, only: [:show]
  resources :recruits, only: [:show]
end