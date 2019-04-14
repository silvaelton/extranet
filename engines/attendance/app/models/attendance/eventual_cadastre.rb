module Attendance
  class EventualCadastre 
    include ActiveModel::Model

    attr_accessor :name, :cpf, :born, :gender_id, :program_id, :password, :sub_program_id,
                  :user_id, :convocation_id, :observation, :password_confirmation, :situation_id
    
    # TODO: Verificar e corrigir numeracao das situacoes

    validates :name, :born, :program_id, :gender_id, :observation, presence: true 
    validates :password, :password_confirmation, presence: true, numericality: true
    validates :cpf, cpf: true, presence: true

    validate  :program_allow?
    validate  :cpf_valid?
    validate  :password_equal
    

    def save
      return false if !valid?

      @cadastre = Support::Candidate::Cadastre.new(
        name: self.name,
        cpf: self.cpf,
        born: self.born,
        gender_id: self.gender_id,
        program_id: self.program_id,
        sub_program_id: self.sub_program_id,
        password: self.password

      )
       if @cadastre.save
        begin
         eventual_situation(@cadastre.id)
        rescue StandarError => e 
          p "EventualCadastre: #{e}"
        end
       end

    end


    def eventual_situation(id)

      if self.convocation_id.present?
        @convocation = Support::Candidate::CadastreConvocation.new(
          cadastre_id: id,
          user_id: self.user_id,
          convocation_id: self.convocation_id,
          observation: self.observation
        )

        @convocation.save(validate: false)
      end 

      @situation = Support::Candidate::CadastreSituation.new(
        cadastre_id: id,
        user_id: self.user_id,
        situation_type_id: self.situation_id, # TODO: Verficacao sobre ID correto
        cadastre_convocation_id: (@convocation.present? ? @convocation.id : nil),
        observation: self.observation,
      )

      @situation.save(validate: false)

      @activity = Support::Candidate::CadastreActivity.new(
        cadastre_id: id,
        user_id: self.user_id,
        title: "Criação de cadastro eventual",
        activity_type_id:  1, # TODO: Verficacao sobre ID correto
        justify: self.observation
      )

      @activity.save

      rescue StandarError => e 
        p "EventualCadastre: #{e}"
    end


     
    private

    def program_allow?

      user  = Pivotal::User.find_by(id: self.user_id)

      return true if user.administrator?
      
      user_programs = Candidate::ProgramUser.where(user_id: self.user_id).map(&:program_id)

      if !user_id.present? || !user_programs.include?(self.program_id)
        errors.add(:program_id, "Você não possui permissão para criar cadastros nessa lista.")
      end

    end

<<<<<<< HEAD
=======
    def confirmation
        self.password_confirmation = BCrypt::Password.create(self.password_confirmation)
    end

>>>>>>> b3e84ad4e7cbe38397a830f9924e748f956cb9f2
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