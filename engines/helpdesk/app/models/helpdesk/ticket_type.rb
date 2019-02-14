require_dependency 'support/helpdesk/ticket_type'

module Helpdesk
  class TicketType < Support::Helpdesk::TicketType
    has_many :ticket_type_users
    has_many :ticket_type_subjects
    
    validates :name, presence: true, uniqueness: true

  end
end