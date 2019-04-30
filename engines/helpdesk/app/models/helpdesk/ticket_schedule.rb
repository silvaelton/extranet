module Helpdesk
  class TicketSchedule
    include ActiveModel::Model

    attr_accessor :schedule_date, :schedule_hour, :ticket_id, :user_id

    validates :schedule_date, presence: true
    
    def save 
      return false if !valid?
      
      ticket = Support::Helpdesk::Ticket.find_by(id: self.ticket_id)
      ticket.update(schedule_date: self.schedule_date, schedule_hour: self.schedule_hour, schedule: true)
    end
  end
end