require_dependency 'support/entity/cadastre_situation'

module Entity
  class CadastreSituation < Support::Entity::CadastreSituation
    validates :name, presence: true

    def presenter
      presenter = call_presenter('Entity::CadastreSituationPresenter', self)
      block_given? ? yield(presenter) : presenter
    end

  end
end