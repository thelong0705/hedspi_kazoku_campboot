Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users,
             :skip => [:registrations]

  devise_scope :user do
    get "users/sign_up", to: "users/registrations#new", as: :new_user_registration
    post "users/sign_up", to: "users/registrations#create", as: :user_registration
  end
  resources :users, :only => [:show]
end
