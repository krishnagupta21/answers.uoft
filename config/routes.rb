Ans::Application.routes.draw do
  get "users/show"
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
 resources :questions do
  resources :answers 
 end
devise_scope :user do
     get "profile", to: "registrations#show"
end
root to: 'questions#index'
end
