Rails.application.routes.draw do
  get 'categories/show'
  get 'articles/index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new', as: 'signup'
  get 'users/create'
  root to: 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
