require_dependency 'support/attendance/attendant_type'

module Attendance
  class Daily < Support::Attendance::Daily

    belongs_to :attendant, class_name: 'Attendance::Attendant'
    belongs_to :station, class_name: 'Attendance::Station'
    belongs_to :category, class_name: 'Attendance::Category'

    scope :by_name,      ->(name) { where("name ilike '%#{name}%'") }
    scope :by_cpf,       ->(cpf) { where(cpf: cpf.gsub('.','').gsub('-','')) }
    scope :by_attendant, ->(attendant) { where(attendant_id: attendant) }
    scope :by_station,   ->(station) { where(station_id: station) }
    scope :by_category,  ->(category) { where(category_id: category) }

    private

    def current_attendant
      Attendance::Attendant.where(staff_id: current_user.id, deleted: false).last.id
    end
    
  end
end
