require_dependency 'support/attendance/attendant_type'

module Attendance
  class AttendantType < Support::Attendance::AttendantType

    validates :name, presence: true, uniqueness: { scope: :deleted}

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,      ->(status) { where(status: status) }
    
  end
end
