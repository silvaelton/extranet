require_dependency 'support/attendance/ticket_step'

module Attendance
  class TicketStep < Support::Attendance::TicketStep
    belongs_to :ticket_category_step, foreign_key: :category_step_id

    has_many :ticket_documents
  end
end