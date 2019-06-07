require_dependency 'support/attendance/ticket_category_term'

module Attendance
  class TicketCategoryTerm < Support::Attendance::TicketCategoryTerm
    belongs_to :ticket_category
    belongs_to :term, class_name: 'Support::Attendance::Term', foreign_key: :term_id

    validates :term_id, presence: true
    validates_uniqueness_of :term_id, scope: :ticket_category_id, conditions: -> { not_deleted }
  end 
end