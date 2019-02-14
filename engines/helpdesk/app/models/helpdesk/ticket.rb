module Helpdesk
  class Ticket < Support::Helpdesk::Ticket
    belongs_to :ticket_type
    belongs_to :ticket_subject, class_name: 'Helpdesk::TicketTypeSubject', foreign_key: :subject_id
    belongs_to :staff, class_name: 'Pivotal::User'

    validates :ticket_type_id, :subject_id, :contact, :description, presence: true
    validates :schedule_date, presence: true, if: -> { self.schedule }
    
    scope :by_current_user, -> (current_user) {
      where(ticket_type_id: current_user_types(current_user))  
    }

    def self.current_user_types(current_user)
      TicketTypeUser.where(user_id: current_user.id).map(&:ticket_type_id)
    end

  end
end