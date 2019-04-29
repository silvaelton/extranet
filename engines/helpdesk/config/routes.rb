Helpdesk::Engine.routes.draw do
  root 'tickets#index'

  resources :tickets, path: 'chamados' do
    resources :ticket_activities, as: :activities 
    resources :ticket_schedules,  as: :schedules 
    resources :ticket_transfers,  as: :transfers 
    resources :ticket_answers,    as: :answers 
    resources :ticket_closes,     as: :closes
    resources :ticket_cancels,    as: :cancels
  end

  resources :ticket_situation_types, path: 'situacoes'

  resources :ticket_types, path: 'tipos' do
    get 'subject', on: :collection

    resources :ticket_type_users
    resources :ticket_type_subjects
  end

  resources :ticket_locations, path: 'locais'
end
