require_dependency 'support/entity/cadastre_member'

module Entity
  class President < Support::Entity::CadastreMember 
    
    default_scope -> { where(job_id: 2)}
  end
end