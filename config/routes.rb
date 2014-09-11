Infoapp::Application.routes.draw do
  root to: 'home#index'
  get '/logout' => 'sessions#destroy', as: :log_out

  resources :sessions
  resources :users 
  resources :trips

  get '/mylocations' => 'users#show', as: :home
  
  get '/locations/:id' => 'locations#show'
  post '/locations/:id' => 'locations#create'
  patch '/locations/:id' => 'locations#update'
  
  delete '/locations/:id' => 'locations#destroy', as: :location_delete
end
