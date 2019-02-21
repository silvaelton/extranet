require_dependency 'support/attendance/category'

module Attendance
  class Category < Support::Attendance::Category

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,      ->(status) { where(status: status) }
  end
end
