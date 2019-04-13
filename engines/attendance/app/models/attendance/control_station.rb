require_dependency 'support/attendance/control_station'

module Attendance
  class ControlStation < Support::Attendance::ControlStation

    validates :station_id, presence: true

    enum situation: ["Aberto",  "Fechado"]

  end
end
