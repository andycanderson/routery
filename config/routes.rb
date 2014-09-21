Infoapp::Application.routes.draw do
  
  # home page
  root to: 'home#index'

  # login logout
  get '/logout' => 'sessions#destroy', as: :log_out
  resources :sessions, only: [:new, :create]
  
  # making account and main page
  resources :users, only: [:create, :show]
  resources :trips, only: [:show, :create, :update, :destroy] 

  get '/mylocations' => 'users#show', as: :home
  
  # get '/locations' => 'locations#index'

  get '/locations/:id' => 'locations#show', as: :location
  # post '/locations/:id' => 'locations#create'
  patch '/locations/:id' => 'locations#update', as: :location_update
  
  delete '/locations' => 'locations#destroy', as: :location_delete

  # new location
  post '/add_dropped' => 'locations#dropped_pins'

  # get '/sharelink' => 'share#getlink'
  get '/share/:id' => 'share#show', as: :share
  get '/shareall/:id' => 'share#index', as: :shareall
end
