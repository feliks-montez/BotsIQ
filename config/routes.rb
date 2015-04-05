Rails.application.routes.draw do
  root 'teams#index'
  
  get '/signin'  => 'sessions#new',     as: 'signin'
  get '/signout' => 'sessions#destroy', as: 'signout'
  
  team_constraints = { team_id: /\d*/ }
  scope '/teams/:team_id', constraints: team_constraints do
  
    resources :positions
    resources :users
    
#    scope 'positions' do
#      match ''     => 'positions#index', as: 'positions', via: :all
#      get   'new' => 'positions#new', as: 'new_position'
#      get   ':id/edit' => 'positions#edit', as: 'edit_position'
#    end
#    
#    scope 'members' do
#      match '', to: 'users#index', as: 'users', via: :all
#      get   'new', to: 'users#new', as: 'new_user'
#      get   ':id', to: 'users#show', as: 'user'
#      get   ':id/edit', to: 'users#edit', as: 'edit_user'
#    end
  end
  
  resources :projects
  resources :sessions
  resources :teams
end
