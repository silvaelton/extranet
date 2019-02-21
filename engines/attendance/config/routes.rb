Attendance::Engine.routes.draw do
  root 'dashboard#index'

  resources :tickets, path: 'atendimentos'
  resources :requeriments
  resources :daily_types
  resources :daily_preferential_types
  resources :categories
  resources :attendant_types
  resources :attendants
  resources :dailies
  resources :stations do 
    resources :attendant_stations
  end
end
