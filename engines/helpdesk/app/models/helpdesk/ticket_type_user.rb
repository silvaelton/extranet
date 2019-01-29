require_dependency 'support/helpdesk/ticket_type_user'

module Helpdesk
  class TicketTypeUser < Support::Helpdesk::TicketTypeUser
    belongs_to :staff, class_name: 'Pivotal::User'
    belongs_to :user,  class_name: 'Pivotal::User'

    validates :staff_id, presence: true
    validates_uniqueness_of :staff_id, conditions: -> { not_deleted }
  end
end