Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    resources :companies
    root 'static_pages#home'
  
    devise_for :users,
               :skip => [:registrations]
  
    devise_scope :user do
      get "users/sign_up", to: "users/registrations#new", as: :new_user_registration
      post "users/sign_up", to: "users/registrations#create", as: :user_registration
      get "users/edit", to: "users/registrations#edit", as: :edit_user
      put "users/sign_up", to: "users/registrations#update"
    end
    
    resources :users, :only => [:show]
  end
end
