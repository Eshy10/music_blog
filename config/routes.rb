Rails.application.routes.draw do
  get 'comments/create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/user_article', to: 'articles#user_articles'
  root to: 'categories#index'
  resources :users, only: [:new, :create, :show]
  resources :articles do
  resources :comments, only: [:create]
    member do
      post 'upvote'
      delete 'downvote'
    end
  end
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
