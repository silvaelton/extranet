require_dependency "support/entity/cadastre"

module Entity
  class UpdateSituation < Support::Entity::Cadastre
    validates :situation_id, presence: true
  end
end