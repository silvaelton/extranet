require_dependency 'support/attendance/daily_type'

module Attendance
  class DailyType < Support::Attendance::DailyType

    validates :name, presence: true, uniqueness: { scope: :deleted}

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,      ->(status) { where(status: status) }
    
  end
end
