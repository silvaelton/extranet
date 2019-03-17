require_dependency "support/candidate/cadastre_inheritor"

module Candidate
  class CadastreInheritor < Support::Candidate::CadastreInheritor

    belongs_to :gender, class_name: 'Support::Common::Gender'
    belongs_to :civil_state, class_name: 'Support::Common::CivilState'

    validates :name, :cpf, :civil_state_id, presence: true

  end
end