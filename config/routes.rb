Rails.application.routes.draw do

  mount Pivotal::Engine    => '/',          as: :pivotal
  mount Helpdesk::Engine   => '/helpdesk',  as: :helpdesk
  mount Candidate::Engine  => '/candidato', as: :candidate

end
