Candidate::Engine.routes.draw do
  root 'dashboard#index'

  resources :cadastres,                  path: 'cadastros'
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
end
