Brb::Engine.routes.draw do
  root 'invoices#index'

  resources :invoices
  resources :invoice_types
  resources :categories
end
