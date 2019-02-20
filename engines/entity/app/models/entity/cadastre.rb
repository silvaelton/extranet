require_dependency 'support/entity/cadastre'

module Entity
  class Cadastre < ::Support::Entity::Cadastre
    
    scope :by_acron, -> (value) {
      where("acron ilike ?", "%#{value}%")
    }

    scope :by_cnpj, -> (value) {
      where(cnpj: value.to_s.unformat_cnpj)
    }

    def presenter
      presenter = call_presenter('Entity::CadastrePresenter', self)
      block_given? ? yield(presenter) : presenter
    end

  end
end