
require_dependency 'support/attendance/eventual_cadastre'

module Attendance
  class EventualCadastre < Support::Candidate::Cadastre

    attr_accessor :user_id, :convocation_id, :observation, :password_confirmation
    
    # TODO: Verificar e corrigir numeracao das situacoes
    default_scope -> {joins(:cadastre_situations).where('candidate_cadastre_situations.situation_type_id = ?', 69)}

    belongs_to :gender, class_name: "Support::Common::Gender", foreign_key: :gender_id

    scope :by_name, ->(name) { where("name ilike '%#{name}%'") }
    scope :by_cpf,  ->(cpf) { where(cpf: cpf.unformat_cpf) }

    validates :name, :born, :program_id, :gender_id, :observation, presence: true 
    validates :password, :password_confirmation, presence: true, numericality: true
    validates :cpf, cpf: true, presence: true

    validate  :program_allow?
    validate  :cpf_valid?
    validate :password_equal
    
    after_create :eventual_situation


    def eventual_situation

      if self.convocation_id.present?
        @convocation = Support::Candidate::CadastreConvocation.new(
          cadastre_id: self.id,
          user_id: self.user_id,
          convocation_id: self.convocation_id,
          observation: self.observation
        )

        @convocation.save(validate: false)
      end 

      @situation = Support::Candidate::CadastreSituation.new(
        cadastre_id: self.id,
        user_id: self.user_id,
        situation_type_id: 69, # TODO: Verficacao sobre ID correto
        cadastre_convocation_id: (@convocation.present? ? @convocation.id : nil),
        observation: self.observation,
      )

      @situation.save(validate: false)

      @activity = Support::Candidate::CadastreActivity.new(
        cadastre_id: self.id,
        user_id: self.user_id,
        title: "Criação de cadastro eventual",
        activity_type_id:  1, # TODO: Verficacao sobre ID correto
        justify: self.observation
      )

      @activity.save

    rescue StandarError => e
      p e
    end 

     
    private

    def program_allow?
      user_programs = Candidate::ProgramUser.where(user_id: self.user_id).map(&:program_id)

      if !user_id.present? || !user_programs.include?(self.program_id)
        errors.add(:program_id, "Você não possui permissão para criar cadastros nessa lista.")
      end

    end

    def confirmation
        self.password_confirmation = BCrypt::Password.create(self.password_confirmation)
      end

    def cpf_valid?
      candidate_cadastre = Candidate::Cadastre.find_by(cpf: self.cpf)
      dependent = Candidate::Dependent.find_by(cpf: self.cpf)

      if candidate_cadastre.present?
        errors.add(:cpf, "já existe na base de dados")
      else
        if dependent.present?
          errors.add(:cpf, "já existe na base de dados como dependente do CPF: #{dependent.cadastre.cpf}")
        end
      end

    end

    def password_equal
      if (self.password != self.password_confirmation)
        errors.add(:password, "não é igual a confirmação")
      end
    end

  end
end