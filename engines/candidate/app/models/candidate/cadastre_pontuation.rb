require_dependency "support/candidate/cadastre_pontuation"

module Candidate
  class CadastrePontuation < Support::Candidate::CadastrePontuation

    belongs_to :cadastre, required: false
  end
end
