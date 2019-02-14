require_dependency 'support/helpdesk/ticket_type_subject'

module Helpdesk
  class TicketTypeSubject < Support::Helpdesk::TicketTypeSubject


    def self.by_ticket_type(ticket_type_id)
      where(ticket_type_id: ticket_type_id).order(:name)
    end
  end
end