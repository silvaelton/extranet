require_dependency 'support/attendance/ticket_category'

module Attendance
  class TicketCategory < Support::Attendance::TicketCategory

    validates :name, presence: true

    has_many :ticket_category_steps
    
    scope :by_name,    ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,  ->(status) { where(status: status) }
    
  end
end
