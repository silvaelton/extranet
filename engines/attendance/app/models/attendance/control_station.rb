require_dependency 'support/attendance/control_station'

module Attendance
  class ControlStation < Support::Attendance::ControlStation

    validates :station_id, presence: true

  end
end
 