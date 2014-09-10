Infoapp::Application.routes.draw do
  root to: 'home#index'
  get '/logout' => 'sessions#destroy', as: :log_out
  resources :sessions
  resources :locations
  resources :users 
end
