require_dependency 'support/entity/cadastre'

module Entity
  class CadastrePassword
    include ActiveModel::Model

    attr_accessor :cadastre_id, :password, :password_confirmation
    
    validates :password, :password_confirmation, presence: true, numericality: true, length: { minimum: 6, maximum: 24}
    validate  :password_equal

    def save 
      return false if !valid?
      
      cadastre = Support::Entity::Cadastre.find(self.cadastre_id)
      cadastre.password = self.password
      cadastre.save
    end

    private

    def password_equal
      if (self.password != self.password_confirmation)
        errors.add(:password, "não é igual a confirmação")
      end
    end
  end
end