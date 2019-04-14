require_dependency "support/candidate/cadastre_convocation"

module Candidate
  class CadastreConvocation < Support::Candidate::CadastreConvocation

    belongs_to :user,        class_name: 'Pivotal::User', required: false
    belongs_to :convocation, class_name: 'Candidate::Convocation', required: false
    belongs_to :cadastre,    class_name: 'Candidate::Cadastre', required: false

    validates :convocation_id, :observation, presence: true

    validate :more_than_once?

    def more_than_once?
      if self.cadastre.cadastre_convocations.where(status: true).present?
        errors.add(:status, "O cadastro já posssui uma indicação ativa.")
      end
    end
  end
end
