Ans::Application.routes.draw do
  get "questions/search"
  get "users/show"
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :questions do 
     resources :answers do
       member { post :vote }
     end
  end
devise_scope :user do
     get "profile", to: "registrations#show"
end
root to: 'questions#search'
end
