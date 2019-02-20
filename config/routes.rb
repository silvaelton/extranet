Rails.application.routes.draw do

  mount Address::Engine     => '/imoveis',      as: :address
  mount Api::Engine         => '/api',          as: :api
  mount Attendance::Engine  => '/atendimento',  as: :attendance
  mount Brb::Engine         => '/brb',          as: :brb
  mount Candidate::Engine   => '/candidato',    as: :candidate
  mount Cpl::Engine         => '/cpl',          as: :cpl
  mount Helpdesk::Engine    => '/helpdesk',     as: :helpdesk
  mount Juridical::Engine   => '/juridico',     as: :juridical
  mount Pivotal::Engine     => '/',             as: :pivotal
  mount Sefaz::Engine       => '/sefaz',        as: :sefaz

end
