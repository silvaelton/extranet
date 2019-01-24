Helpdesk::Engine.routes.draw do
  root 'dashboard#index'

  resources :tickets, path: 'chamados'
  resources :ticket_categories, path: 'categorias'
end
