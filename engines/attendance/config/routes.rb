Attendance::Engine.routes.draw do
  root 'dashboard#index'

  resources :tickets, path: 'atendimentos'
  resources :requeriments
end
