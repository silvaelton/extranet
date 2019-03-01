require_dependency 'support/attendance/category'

module Attendance
  class Category < Support::Attendance::Category

    validates :name, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,      ->(status) { where(status: status) }
  end
end
