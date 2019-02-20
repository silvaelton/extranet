require_dependency 'support/entity/cadastre'

module Entity
  class Cadastre < ::Support::Entity::Cadastre
    
    def presenter
      presenter = call_presenter('Entity::CadastrePresenter', self)
      block_given? ? yield(presenter) : presenter
    end

  end
end