module Pivotal
  class Session
    include ActiveModel::Model

    attr_accessor :code, :password, :user_id

    validates :code, :password, presence: true
    validate  :authenticate
    
    private 

    def authenticate
      user = Pivotal::User.where(status: true).find_by(code: self.code)
      
      if (BCrypt::Password.new(user.try(:password)) == self.password)
        self.user_id = user.id
      else 
        errors.add(:base, 'Não válido')
      end    

    end
  end
end