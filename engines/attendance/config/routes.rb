Attendance::Engine.routes.draw do
  root 'dashboard#index'

  resources :tickets, path: 'atendimentos' do
    resources :ticket_viewers
  end

  resources :requeriments, path: 'requerimentos'
  resources :requeriment_categories, path: 'requerimento-categorias'
  
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
  
  # Agendamento
  resources :agenda_categories, path: 'agenda-categorias'
  resources :agenda_situations, path: 'agenda-situacoes'
  resources :agendas, path: 'agendas' do
    resources :agenda_schedules, path: 'agendamentos'
  end
  
  resources :agenda_reference_categories, path: 'agenda-referencia-categorias' do
    resources :agenda_references, path: 'cadastros'
  end

  # Atendimento
  resources :ticket_categories, path: 'atendimento-categorias' do
    resources :ticket_category_steps do
      resources :step_documents
    end
  end

  resources :stations, path: 'postos' do 
    resources :attendant_stations
  end
end
