Rails.application.routes.draw do

  mount Attendance::Engine  => '/atendimento', as: :attendance
  mount Helpdesk::Engine    => '/helpdesk',    as: :helpdesk
  mount Candidate::Engine   => '/candidato',   as: :candidate
  mount Pivotal::Engine     => '/',            as: :pivotal

end
