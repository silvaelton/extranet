require_dependency "support/candidate/cadastre_situation"

module Candidate
  class CadastreSituation < Support::Candidate::CadastreSituation

    belongs_to :user, class_name: 'Pivotal::User', required: false
    belongs_to :cadastre_convocation, class_name: 'Candidate::CadastreConvocation', required: false

    validates :situation_type_id, :observation, presence: true

    def current_cadastre_convocation
      Candidate::CadastreConvocation.order(created_at: :asc).where(cadastre_id: @cadastre, status: true).last.id
    end

  end
end