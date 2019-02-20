require_dependency 'support/attendance/attendant_type'

module Attendance
  class Station < Support::Attendance::Station

    belongs_to :responsible, class_name: 'Pivotal::User'

    has_many :attendant_stations

    scope :by_name,        ->(name) { where("name ilike '%#{name}%'") }
    scope :by_responsible, ->(responsible) { where(responsible_id: responsible) }
    scope :by_status,      ->(status) { where(status: status) }
    
  end
end
