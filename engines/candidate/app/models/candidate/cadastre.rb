require_dependency "support/candidate/cadastre"

module Candidate
  class Cadastre < Support::Candidate::Cadastre

    belongs_to :city,       class_name: 'Support::Common::City'
    belongs_to :state,      class_name: 'Support::Common::State'
    belongs_to :program,    class_name: 'Support::Candidate::Program'
    belongs_to :subprogram, class_name: 'Support::Candidate::Program'

    has_many :cadastre_situations
    has_many :cadastre_inheritors
    has_many :cadastre_convocations
    has_many :cadastre_activities
    has_many :cadastre_procedurals
    has_many :cadastre_pontuations
    has_many :dependents
    has_many :indication_unitaries

    has_many :exemptions,  primary_key: :cpf, foreign_key: :cpf, class_name: "Sefaz::Exemption"
    has_many :assessments, primary_key: :cpf, foreign_key: :cpf, class_name: "Protocol::Assessment"
    has_many :invoices,    primary_key: :cpf, foreign_key: :cpf, class_name: "Brb::Invoice"

    scope :by_cpf, -> (value) {
      where(cpf: value.to_s.unformat_cpf)
    }

  end
end
