require_dependency 'support/attendance/attendant_type'

module Attendance
  class Daily < Support::Attendance::Daily

    validates :name,:cpf, :station_id, :category_id, :daily_type_id, presence: true
    validates :cpf, cpf: true


    attr_accessor :attendant_validation

    belongs_to :attendant, class_name: 'Attendance::Attendant', required: false
    belongs_to :station, class_name: 'Attendance::Station', required: false
    belongs_to :category, class_name: 'Attendance::Category', required: false
    belongs_to :daily_type, class_name: 'Attendance::DailyType', required: false
    belongs_to :preferential_type, class_name: 'Attendance::DailyPreferentialType', required: false
    belongs_to :special_condition_type, class_name: 'Support::Common::SpecialConditionType', required: false

    scope :by_name,      ->(name) { where("name ilike '%#{name}%'") }
    scope :by_cpf,       ->(cpf) { where(cpf: cpf.gsub('.','').gsub('-','')) }
    scope :by_attendant, ->(attendant) { where(attendant_id: attendant) }
    scope :by_station,   ->(station) { where(station_id: station) }
    scope :by_category,  ->(category) { where(category_id: category) }

    validate :attendant?

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
