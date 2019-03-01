require_dependency 'support/attendance/daily_preferential_type'

module Attendance
  class DailyPreferentialType < Support::Attendance::DailyPreferentialType

    validates :name, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,      ->(status) { where(status: status) }
    
  end
end
