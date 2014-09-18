Infoapp::Application.routes.draw do
  root to: 'home#index'
  get '/logout' => 'sessions#destroy', as: :log_out

  resources :sessions
  resources :users 
  resources :trips

  get '/mylocations' => 'users#show', as: :home
  
  # get '/locations' => 'locations#index'

  get '/locations/:id' => 'locations#show', as: :location
  # post '/locations/:id' => 'locations#create'
  patch '/locations/:id' => 'locations#update', as: :location_update
  
  delete '/locations' => 'locations#destroy', as: :location_delete

  post '/add_dropped' => 'locations#dropped_pins'

  get '/sharelink' => 'share#getlink'
  get '/share/:id' => 'share#show'
  get '/shareall/:id' => 'share#index'
end
