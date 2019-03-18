require_dependency "support/attendance/agenda_reference_category"

module Attendance
  class AgendaReferenceCategory < Support::Attendance::AgendaReferenceCategory
    has_many :agenda_references, foreign_key: :category_id
    
    validates :name, presence: true
  end
end