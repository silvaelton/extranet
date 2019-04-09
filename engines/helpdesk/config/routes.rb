Helpdesk::Engine.routes.draw do
  root 'tickets#index'

  resources :tickets, path: 'chamados' do
    get 'get_ticket'
    
    get 'answer'
    
    resources :ticket_activities
  end

  resources :ticket_situation_types, path: 'situacoes'

  resources :ticket_types, path: 'tipos' do
    get 'subject', on: :collection

    resources :ticket_type_users
    resources :ticket_type_subjects
  end

  resources :ticket_locations, path: 'locais'
end
