Sefaz::Engine.routes.draw do
  root 'allotments#index'

  resources :exemption_types,    path: 'isencao-tipos'
  resources :request_types,      path: 'solicitacao-tipos'
  resources :request_situations, path: 'solicitacao-situacoes'
  resources :notifiers,          path: 'transmitentes'

  resources :allotments, path: 'lotes' do
    get 'to_process'
    get 'send_exemption'
    get 'send_parcial_cancelation'
    get 'send_total_cancelation'
    resources :exemptions,         path: 'isencoes'
    resources :total_exemptions,   path: 'cancelamento-total'
    resources :parcial_exemptions, path: 'cancelamento-parcial'
    resources :exemption_files, only: [:new, :create]
  end
end
