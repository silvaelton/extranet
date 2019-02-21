Sefaz::Engine.routes.draw do
  resources :exemption_types,    path: 'isencao-tipos'
  resources :request_types,      path: 'solicitacao-tipos'
  resources :request_situations, path: 'solicitacao-situacoes'
  resources :notifiers,          path: 'transmitentes'

  resources :allotments, path: 'lotes' do
    resources :exemptions,         path: 'isencoes'
    resources :total_exemptions,   path: 'cancelamento-total'
    resources :parcial_exemptions, path: 'cancelamento-parcial'
  end
end
