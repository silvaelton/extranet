Candidate::Engine.routes.draw do
  root 'home#index'

  resources :activity_types,             path: 'atividade-tipos'
  resources :cadins,                     path: 'imobiliario-cadastros'
  resources :indication_allotments,      path: 'indicacao-lotes'
  resources :indication_activity_types,  path: 'indicacao-atividade-tipos'
  
  resources :occurrence_targets,         path: 'objetos-ocorrencias'
  resources :procedural_types,           path: 'processos-tipos'
  resources :situation_types,            path: 'situacoes-tipos'
  
  
  resources :convocations,  path: 'convocacoes'
  resources :lists,         path: 'listas'
  resources :occurrences,   path: 'ocorrencias'
  resources :notifications, path: 'notificacoes'

  resources :update_contacts, path: 'atualizacao-contatos'
  resources :programs, path: 'programas' do
    resources :program_users, path: 'programas-permissoes'
  end

  resources :search_cadastres
  resources :cadastres, path: 'cadastros' do
    resources :cadastre_situations
    resources :cadastre_procedural_situations
    resources :cadastre_convocations
    resources :cadastre_reservations
    resources :cadastre_contacts
    resources :cadastre_general
    resources :dependents
    resources :cadastre_activities
    resources :cadastre_inheritors
    resources :cadastre_pontuations
    resources :cadastre_occurrences
    resources :cadastre_indications
    resources :cadastre_schedules
    resources :cadastre_chats
    resources :cadastre_notifications
    resources :cadastre_communications
    resources :cadastre_helps
  end
end
