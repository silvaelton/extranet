require_dependency "support/candidate/cadastre"

module Candidate
  class UpdateGeneral < Support::Candidate::Cadastre

    validates :cpf, :name, presence: true

  end
end