require_dependency 'support/attendance/attendant_type'

module Attendance
  class AttendantStation < Support::Attendance::AttendantStation

    belongs_to :station, class_name: 'Attendance::Station'
    belongs_to :creator, class_name: 'Pivotal::User'
    belongs_to :attendant, class_name: 'Attendance::Attendant'

    scope :by_attendant, ->(attendant) { where(attendant_id: attendant) }
    
  end
end
