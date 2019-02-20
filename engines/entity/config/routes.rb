Entity::Engine.routes.draw do
  root 'cadastres#index'

  resources :cadastres, path: 'cadastros'

  resources :cadastre_situations, path: 'cadastro-situacoes'
  resources :member_jobs, path: 'diretoria-cargos'

  resources :raffles, path: 'sorteios' do
    resources :raffle_groups, path: 'grupos' do
      resources :raffle_group_units, path: 'unidades'
    end
    resources :manifestations, path: 'manifestacoes'
  end

  resources :provisional_cadastres, path: 'cadastro-eventuais'
  resources :audits, path: 'atividades'

end
