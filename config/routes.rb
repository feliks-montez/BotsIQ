Rails.application.routes.draw do
  root 'teams#index'
  
  get '/signin'  => 'sessions#new',     as: 'signin'
  get '/signout' => 'sessions#destroy', as: 'signout'
  
  resources :teams do
    resources :positions
    resources :users
    resources :projects
  end
  resources :sessions
end
