module Pivotal
  class Session
    include ActiveModel::Model

    attr_accessor :username, :password, :user_id

    validates :username, :password, presence: true
    validate  :authenticate
    

    def logger!(request, action)
      log = Pivotal::LogSession.new

      log.target_id     = self.user_id
      log.target_model  = 'Pivotal::User'
      log.target_action = action
      log.ip            = request.remote_ip
      
      log.save
    end

    private 

    def authenticate
      username_array = self.username.split('@')
      
      if username_array.count > 1

        admin = username_array[0]
        user  = username_array[1]

        user  = Pivotal::User.where(status: true).find_by(username: user)
        admin = Pivotal::User.where(status: true, administrator: true).find_by(username: admin)
        
        if !user.nil? && !admin.nil? && (BCrypt::Password.new(admin.try(:password)) == self.password)
          self.user_id = user.id
        else 
          errors.add(:username, 'não válido')
          errors.add(:password, 'não confere')
        end
        
      else
        
        user = Pivotal::User.where(status: true).find_by(username: self.username)
        
        if !user.nil? && (BCrypt::Password.new(user.try(:password)) == self.password)
          self.user_id = user.id
        else 
          errors.add(:username, 'não válido')
          errors.add(:password, 'não confere')
        end

      end
     
    end
  end
end