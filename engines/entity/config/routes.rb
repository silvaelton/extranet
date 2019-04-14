Entity::Engine.routes.draw do
  root 'cadastres#index'

  resources :cadastres, path: 'cadastros' do 
    resources :members, path: 'membros'
    resources :presidents, path: 'presidentes'
    resources :cadastre_activities, path: 'cadastro-atividades'
    resources :cadastre_audits
    resources :cadastre_passwords
  end

  resources :update_contacts, path: 'atualizacao-contatos'
  resources :update_situations, path: 'atualizacao-situacao'

  resources :cadastre_situations, path: 'cadastro-situacoes'
  resources :enterprises, path: 'vinculo-empreendimentos'
  resources :member_jobs, path: 'diretoria-cargos'

  resources :raffles, path: 'sorteios' do
    resources :raffle_groups, path: 'grupos' do
      resources :raffle_group_units, path: 'unidades'
    end
    resources :manifestations, path: 'manifestacoes'
  end

  resources :provisional_cadastres, path: 'cadastro-eventuais'

  resources :apps, path: 'aplicativo'
end
