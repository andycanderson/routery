Infoapp::Application.routes.draw do
  root to: 'home#index'
  get '/logout' => 'sessions#destroy', as: :log_out

  resources :sessions
  resources :users 
  resources :trips

  # home page
  get '/mylocations' => 'users#show', as: :home
  
  get '/locations/:id' => 'locations#show'
  post '/locations/:id' => 'locations#create'
  patch '/locations/:id' => 'locations#update', as: :location_update
  
  delete '/locations/:id' => 'locations#destroy', as: :location_delete

  post '/add_dropped' => 'locations#dropped_pins'
end
