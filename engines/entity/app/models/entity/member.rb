require_dependency 'support/entity/cadastre_member'

module Entity
  class Member < Support::Entity::CadastreMember 
    
    default_scope -> { where('job_id <> 2 OR job_id is null')}
  end
end