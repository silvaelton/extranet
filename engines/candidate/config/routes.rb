Candidate::Engine.routes.draw do
  root 'home#index'


  resources :activity_types,             path: 'atividade-tipos'
  resources :cadins,                     path: 'cadastros-imobiliario'
  resources :convocations,               path: 'convocacoes'
  resources :indication_activity_types,  path: 'indicacoes-atividades-tipos'
  resources :indication_allotments,      path: 'lotes-indicacoes'
  resources :iptus,                      path: 'iptus'
  resources :lists,                      path: 'listas'
  resources :occurrence_targets,         path: 'objetos-ocorrencias'
  resources :procedural_types,           path: 'processsos-tipos'
  resources :situation_types,            path: 'situacoes-tipos'

  resources :cadastres, path: 'cadastros' do
    resources :cadastre_situations
    resources :cadastre_procedural_situations
    resources :cadastre_convocations
    resources :cadastre_reservations
    resources :cadastre_contacts
    resources :cadastre_general
    resources :cadastre_dependents
    resources :cadastre_inheritors
    resources :cadastre_pontuations
    resources :cadastre_occurrences
    resources :cadastre_indications
    resources :cadastre_schedules
    resources :cadastre_chats
    resources :cadastre_notifications
    resources :cadastre_communications
    resources :cadastre_activities
    resources :cadastre_helps
  end
end
