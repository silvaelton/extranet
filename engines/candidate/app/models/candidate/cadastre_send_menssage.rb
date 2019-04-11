module Candidate
  class CadastreSendMenssage
    include ActiveModel::Model

    attr_accessor :content, :user_id, :cadastre_id 

    validates :content, :user_id, :cadastre_id, presence: true
    
    def save 
      return if !valid?

      service_notification = Support::Attendance::SendMenssageService.new
      
      device_id = "1254654654"
      
      options = {
        content: self.content,
        device_user_id: device_id
      }

      service_notification.send_menssage(options)
      
      add_activity
    end

    private

    def add_activity
      @activity = Candidate::CadastreActivity.new(
        title: "Envio de SMS",
        justify: self.content,
        user_id: self.user_id,
        activity_type_id: 1,
        cadastre_id: self.cadastre_id
      )

      @activity.save
      
    end
  end
end