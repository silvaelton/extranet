require_dependency 'support/attendance/ticket_category'

module Attendance
  class TicketCategory < Support::Attendance::TicketCategory

    validates :name, presence: true

    has_many :ticket_category_steps
    has_many :ticket_category_terms
    
    
    scope :by_name,    ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,  ->(status) { where(status: status) }

    def filter_program_id
      self[:filter_program_id].join(',')
    end
    
    def filter_situation_id
      self[:filter_situation_id].join(',')
    end
    
  end
end
