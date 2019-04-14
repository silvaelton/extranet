require_dependency "support/candidate/cadastre_procedural"

module Candidate
  class CadastreProcedural < Support::Candidate::CadastreProcedural

    belongs_to :user, class_name: 'Pivotal::User', required: false
    belongs_to :cadastre_convocation, class_name: 'Candidate::CadastreConvocation', required: false
    belongs_to :procedural_type, required: false
  end
end
