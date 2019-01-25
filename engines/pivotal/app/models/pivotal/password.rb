require_dependency 'support/person/staff'

module Pivotal
  class Password
    include ActiveModel::Model
    
    attr_accessor :password_current, :password_new, :password_confirmation

    validate  :password_valid?

    def update_password!
      return false if !valid?
      self.update(password: self.password_new)
    end

    private 


    def password_valid?
      if (BCrypt::Password.new(self.try(:password)) == self.password_current)
        errors.add(:password_current, 'Senha atual inválida')
      end
      
      if self.password_new != self.password_confirmation
        errors.add(:password_confirmation, 'Não é igual a nova senha')
      end
    end
  
  end
end