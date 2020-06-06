Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new', as: 'signup'
  get 'users/create'
  root to: 'articles#index'
  resources :articles
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
