require_dependency "support/helpdesk/ticket_location"

module Helpdesk
  class TicketLocation < Support::Helpdesk::TicketLocation
    validates :name, presence: true
  end
end