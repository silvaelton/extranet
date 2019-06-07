Cpl::Engine.routes.draw do
  root 'notices#index'

  resources :notices, path: 'editais' do
    resources :notice_documents, only: [:index, :new, :create, :destroy]
    resources :notice_participants, only: [:index, :show]
  end
  resources :notice_types, path: 'edital-tipos'
  resources :document_types, path: 'documento-tipos'

end
