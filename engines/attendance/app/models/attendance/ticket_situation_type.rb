require_dependency 'support/attendance/ticket_situation_type'

module Attendance
  class TicketSituationType < Support::Attendance::TicketSituationType

    validates :name, presence: true
    
    scope :by_name,    ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,  ->(status) { where(status: status) }
    
  end
end
