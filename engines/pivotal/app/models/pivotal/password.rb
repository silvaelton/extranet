require_dependency 'support/person/staff'

module Pivotal
  class Password
    include ActiveModel::Model
    
    attr_accessor :user_id, :password_current, :password_new, :password_confirmation
    validates :password_current, :password_new, :password_confirmation, presence: true, length: {minimum: 6, maximum: 26}
    validate  :password_valid?

    def update_password!
      return false if !valid?
      user.update(password: self.password_new)
    end
    
    private 
    
    def user
      Support::Pivotal::User.find_by(id: self.user_id)
    end

    def password_valid?
      user_password = BCrypt::Password.new(user.password)

      if user_password != self.password_current
        errors.add(:password_current, 'inválida')
      end
      
      if self.password_new != self.password_confirmation
        errors.add(:password_confirmation, 'Não é igual a nova senha')
      end
    end
  
  end
end