require_dependency 'support/attendance/attendant_type'

module Attendance
  class Attendant < Support::Attendance::Attendant

    belongs_to :staff, class_name: 'Pivotal::User'
    belongs_to :attendant_type, class_name: 'Attendance::AttendantType'

    scope :by_name, ->(name) { where(staff_id: name) }
    scope :by_type, ->(type) { where(attendant_type_id: type) }
    
  end
end
