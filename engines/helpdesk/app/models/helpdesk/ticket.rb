module Helpdesk
  class Ticket < Support::Helpdesk::Ticket
    belongs_to :ticket_type
    belongs_to :ticket_subject, required: false, class_name: 'Helpdesk::TicketTypeSubject'
    belongs_to :staff, class_name: 'Pivotal::User'

    validates :ticket_type_id, :subject_id, :contact, :description, presence: true
    validates :schedule_date, presence: true, if: -> { self.schedule }
  end
end