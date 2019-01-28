Rails.application.routes.draw do

  mount Attendance::Engine  => '/atendimento',  as: :attendance
  mount Brb::Engine         => '/brb',          as: :brb
  mount Candidate::Engine   => '/candidato',    as: :candidate
  mount Helpdesk::Engine    => '/helpdesk',     as: :helpdesk
  mount Pivotal::Engine     => '/',             as: :pivotal

end
