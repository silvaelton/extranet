Rails.application.routes.draw do

  root 'pivotal/dashboard#index'

  mount Address::Engine     => '/imoveis',      as: :address
  mount Api::Engine         => '/api',          as: :api
  mount Attendance::Engine  => '/atendimento',  as: :attendance
  mount Entity::Engine      => '/entidade',     as: :entity
  mount Brb::Engine         => '/brb',          as: :brb
  mount Candidate::Engine   => '/candidato',    as: :candidate
  mount Cpl::Engine         => '/cpl',          as: :cpl
  mount Helpdesk::Engine    => '/helpdesk',     as: :helpdesk
  mount Juridical::Engine   => '/juridico',     as: :juridical
  mount Pivotal::Engine     => '/nucleo',       as: :pivotal
  mount Protocol::Engine    => '/protocolo',    as: :protocol
  mount Sefaz::Engine       => '/sefaz',        as: :sefaz


  get 'unpermitted', to: 'errors#unpermitted'
end
