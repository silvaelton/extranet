Brb::Engine.routes.draw do
  root 'invoices#index'

  resources :invoices
end
