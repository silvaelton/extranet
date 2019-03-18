require_dependency 'support/entity/cadastre'

module Entity
  class Cadastre < ::Support::Entity::Cadastre
    has_many :presidents, foreign_key: :cadastre_id
    has_many :members, foreign_key: :cadastre_id
    has_many :cadastre_activities, foreign_key: :cadastre_id

    validates :cnpj, cnpj: true
    
    scope :by_acron, -> (value) {
      where("acron ilike ?", "%#{value}%")
    }

    scope :by_cnpj, -> (value) {
      where(cnpj: value.to_s.unformat_cnpj)
    }

    scope :by_situation, -> (value) {
      where(situation_id: value)
    }

    def presenter
      presenter = call_presenter('Entity::CadastrePresenter', self)
      block_given? ? yield(presenter) : presenter
    end

  end
end