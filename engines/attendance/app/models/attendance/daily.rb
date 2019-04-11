require_dependency 'support/attendance/attendant_type'

module Attendance
  class Daily < Support::Attendance::Daily

    validates :name,:cpf, :station_id, :category_id, :daily_type_id, presence: true

    attr_accessor :attendant_validation

    belongs_to :attendant, class_name: 'Attendance::Attendant'
    belongs_to :station, class_name: 'Attendance::Station'
    belongs_to :category, class_name: 'Attendance::Category'

    scope :by_name,      ->(name) { where("name ilike '%#{name}%'") }
    scope :by_cpf,       ->(cpf) { where(cpf: cpf.gsub('.','').gsub('-','')) }
    scope :by_attendant, ->(attendant) { where(attendant_id: attendant) }
    scope :by_station,   ->(station) { where(station_id: station) }
    scope :by_category,  ->(category) { where(category_id: category) }

    validate  :attendant?

    def current_attendant(user)
      self.attendant_validation = Attendance::Attendant.where(staff_id: user, deleted: false).last.id rescue nil
    end

    private

    def attendant?

      if !self.attendant_validation.present? 
        errors.add(:cpf, "não foi cadastrado. Você nao possui permissão de atendente para essa ação.")
      end

    end
    
  end
end
