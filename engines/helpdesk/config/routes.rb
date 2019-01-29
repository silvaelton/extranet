Helpdesk::Engine.routes.draw do
  root 'dashboard#index'

  resources :tickets, path: 'chamados'

  resources :ticket_types, path: 'tipos' do
    get 'subject', on: :collection

    resources :ticket_type_users
    resources :ticket_type_subjects
  end



end
