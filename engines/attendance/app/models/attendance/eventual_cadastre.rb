
require_dependency 'support/attendance/eventual_cadastre'

module Attendance
  class EventualCadastre < Support::Candidate::Cadastre

    attr_accessor :user_id, :convocation_id
    
    default_scope -> {joins(:cadastre_situations).where('candidate_cadastre_situations.situation_type_id = 69' )}

    belongs_to :gender, class_name: "Support::Common::Gender", foreign_key: :gender_id

    scope :by_name, ->(name) { where("name ilike '%#{name}%'") }
    scope :by_cpf,  ->(cpf) { where(cpf: cpf) }

    validates :name, :born, :program_id, :gender_id, :convocation_id, presence: true
    validates :cpf, cpf: true, presence: true

    #validate  :cpf_valid?
    validate  :program_allow?

    after_create :eventual_situation


    def eventual_situation

      @convocation = Candidate::CadastreConvocation.new(
        cadastre_id: self.id,
        user_id: self.user_id,
        convocation_id: self.convocation_id,
        observation: "Convocação criada a partir da criação do cadastro eventual"
      )

      if @convocation.save

        begin
          @situation = Candidate::CadastreSituation.new(
            cadastre_id: self.id,
            user_id: self.user_id,
            situation_type_id: 69,
            cadastre_convocation_id: @convocation.id,
            observation: "Criação de cadastro eventual",
          )

          if @situation.save
            @activity = Candidate::CadastreActivity.new(
              cadastre_id: self.id,
              user_id: self.user_id,
              title: "Criação de cadastro eventual",
              activity_type_id:  1,
              justify: "Candiadato não pussuia cadastro na Codhab"
            )

            @activity.save
          end

        rescue Exception => e
          p e
        end
      end   
    end

      
    private

    def program_allow?
      user_programs = Candidate::ProgramUser.where(user_id: self.user_id).map(&:program_id)

      if !user_id.present? || !user_programs.include?(self.program_id)
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