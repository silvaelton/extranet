
require_dependency 'support/attendance/eventual_cadastre'

module Attendance
  class EventualCadastre < Support::Attendance::EventualCadastre
    belongs_to :cadastre, class_name: "Candidate::Cadastre", foreign_key: :cadastre_id
    belongs_to :gender, class_name: "Support::Common::Gender", foreign_key: :gender_id

    attr_accessor :name, :cpf, :born, :program_id, :convocation_id, :observation

    validates :name, :born, :program_id, :convocation_id, :observation, :gender_id
    validates :cpf, cpf: true, presence: true

    validate  :cpf_valid?
    validate  :program_allow?
    
    private

    def program_allow?
      user_programs = Candidate::ProgramCandidate.where(user_id: self.user_id).map(&:program_id)

      if !user.present? || user_programs.include?(self.program_id)
        errors.add(:program_id, "Você não possui permissão para criar cadastros nessa lista.")
      end

    end

    def cpf_valid?
      candidate_cadastre = Candidate::Cadastre.find_by(cpf: self.cpf)
      dependent = Candidate::Dependent.find_by(cpf: self.cpf)

      if candidate_cadastre.present?
        errors.add(:cpf, "já existe na base de dados")
      else
        if dependent.present?
          dependent_cadastre_cpf = dependent.cadastre.cpf
          errors.add(:cpf, "já existe na base de dados como dependente do CPF: #{dependent_cadastre_cpf}")
        end
      end

    end

  end
end