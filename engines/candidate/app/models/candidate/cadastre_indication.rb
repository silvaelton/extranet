require_dependency "support/candidate/cadastre_indication"

module Candidate
  class CadastreIndication < Support::Candidate::CadastreIndication

    belongs_to :cadastre,   required: false    

    validates :name, :cpf, :civil_state_id, :gender_id, presence: true

  end
end
