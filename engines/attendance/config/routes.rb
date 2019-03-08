Attendance::Engine.routes.draw do
  root 'dashboard#index'

  resources :tickets, path: 'atendimentos'
  resources :requeriments
  resources :daily_types
  resources :daily_preferential_types
  resources :categories
  resources :attendant_types
  resources :ticket_situation_types
  resources :document_types
  resources :attendants
  resources :dailies
  
  resources :ticket_categories do
    resources :ticket_category_steps do
      resources :step_documents
    end
  end

  resources :stations do 
    resources :attendant_stations
  end
end
