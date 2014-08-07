Ans::Application.routes.draw do
  get 'tags/:tag', to: 'questions#index', as: :tag 
  get "questions/search"
  get "users/show"
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :activities, only: :index
  resources :users
  resources :questions do 
     resources :answers do
        member do
          put "like", to: "answers#upvote"
          put "dislike", to: "answers#downvote"
        end
      end
  end
devise_scope :user do
     get "profile", to: "registrations#show"
end
root to: 'questions#search'
end
