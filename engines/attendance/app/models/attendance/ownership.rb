module Attendance
  class Ownership
    include ActiveModel::Model

    attr_accessor :cpf, :target_cpf, :observation

    validates :cpf, :target_cpf, presence: true, cpf: true
    validates :observation, presence: true
    validate  :cpf_ownership

    def save
      return false if !valid?

      cadastre = Support::Candidate::Cadastre.find_by(cpf: self.cpf)
      cadastre_target = Support::Candidate::Cadastre.find_by(cpf: self.target_cpf)
      
      cadastre_id = cadastre.id
      cadastre_target_id = cadastre_target.id

      cadastre_uuid = cadastre.uuid
      cadastre_target_uuid = cadastre_target.uuid
        
      cadastre_target.update(id: 9999999999999)
      cadastre.update(id: cadastre_target_id)
  
      cadastre_target.update(cadastre_id)
    end

    private

    def cpf_ownership
      
    end

  end
end