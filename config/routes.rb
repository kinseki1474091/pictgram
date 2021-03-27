Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  #get 'users/index'
  #get 'users/show'
  #devise_for :users
  get 'topics/new'
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  devise_for :users #deviseで作成されたユーザー認証用のルーティング
  
  root to: 'posts#index'
  
  resources :comments #commentsコントローラへのルーティング
  
end
