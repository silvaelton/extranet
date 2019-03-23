require_dependency 'support/attendance/attendant_type'

module Attendance
  class Station < Support::Attendance::Station

    validates :name, presence: true

    has_many :attendant_stations

    scope :by_name,        ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,      ->(status) { where(status: status) }
    
  end
end
