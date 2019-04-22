require_dependency "support/candidate/cadastre"

module Candidate
  class Cadastre < Support::Candidate::Cadastre

    belongs_to :city,        required: false, class_name: 'Support::Common::City'
    belongs_to :state,       required: false, class_name: 'Support::Common::State'
    belongs_to :program,     required: false, class_name: 'Support::Candidate::Program'
    belongs_to :subprogram,  required: false, class_name: 'Support::Candidate::Program'
    belongs_to :civil_state, required: false, class_name: 'Support::Common::CivilState'
    belongs_to :rg_uf,       required: false, class_name: 'Support::Common::State', foreign_key: :rg_uf_id

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
