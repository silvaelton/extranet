require_dependency "support/candidate/cadastre_convocation"

module Candidate
  class CadastreConvocation < Support::Candidate::CadastreConvocation

    belongs_to :user, class_name: 'Pivotal::User'
    belongs_to :convocation, class_name: 'Candidate::Convocation'

    validates :convocation_id, :observation, presence: true

  end
end