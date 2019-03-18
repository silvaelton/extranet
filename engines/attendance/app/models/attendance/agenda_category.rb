require_dependency "support/attendance/agenda_category"

module Attendance
  class AgendaCategory < Support::Attendance::AgendaCategory
    validates :name, presence: true
  end
end