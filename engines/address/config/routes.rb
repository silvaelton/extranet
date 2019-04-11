Address::Engine.routes.draw do
  resources :enterprises, path: 'empreendimentos' do
    resources :enterprise_typologies, path: 'tipologias'
  end

  resources :activity_types,           path: 'atividade-tipos'
  resources :registry_types,           path: 'registro-tipos'
  resources :regions,                  path: 'regioes'
  resources :unit_use_types,           path: 'unidade-tipo-usos'
  resources :unit_situation_types,     path: 'unidade-tipo-situacoes'
  resources :unit_cadastre_situations, path: 'unidade-cadastro-situacoes'
  resources :labels,                   path: 'etiquetas'
  
  resources :enterprise_companies,     path: 'empresas' do
    resources :enterprise_company_users,     path: 'empresas-usuarios'
  end

  resources :units, path: 'unidades' do
    resources :bookings, path: 'reservas', only: %i[new create]
  end

  resources :documents
end
