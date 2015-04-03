Rails.application.routes.draw do
  root 'projects#index'
  
  get '/signin'  => 'sessions#new',     as: 'signin'
  get '/signup'  => 'users#new',        as: 'signup'
  get '/signout' => 'sessions#destroy', as: 'signout'
  
  resources :projects
  resources :users
  resources :sessions
end
