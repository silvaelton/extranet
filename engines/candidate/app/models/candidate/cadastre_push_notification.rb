module Candidate
  class CadastrePushNotification
    include ActiveModel::Model

    attr_accessor :content, :user_id, :cadastre_id, :title 

    validates :content, :title, :user_id, :cadastre_id, presence: true
    
    def save 
      return if !valid?

      service_notification = Support::Attendance::PushNotificationService.new
      
      device_id = "1254654654"

      options = {
        title: self.title,
        content: self.content,
        device_user_id: device_id
      }

      service_notification.send_push(options)
      
      add_activity
    end


    def add_activity
      @activity = Candidate::CadastreActivity.new(
        title: self.title,
        justify: self.content,
        user_id: self.user_id,
        activity_type_id: 1,
        cadastre_id: self.cadastre_id
      )

      @activity.save
      
    end
  end
end