Attendance::Engine.routes.draw do
  root 'dashboard#index'

  resources :tickets,      path: 'atendimentos'
  resources :requeriments, path: 'requerimentos'

  resources :categories
  resources :daily_types
  resources :daily_preferential_types
  
  resources :attendant_types
  resources :ticket_situation_types
  resources :document_types
  resources :attendants

  resources :dailies,            path: 'diarios'
  resources :eventual_cadastres, path: 'inscricao-eventual'
  resources :cadastre_owners,    path: 'troca-titularidades'
  
  resources :agendas, path: 'agendas' do
    resources :schedules, path: 'agendamentos'
  end
  
  resources :ticket_categories do
    resources :ticket_category_steps do
      resources :step_documents
    end
  end

  resources :stations, path: 'postos' do 
    resources :attendant_stations
  end
end
