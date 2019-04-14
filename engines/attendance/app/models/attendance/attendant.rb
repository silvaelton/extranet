require_dependency 'support/attendance/attendant_type'

module Attendance
  class Attendant < Support::Attendance::Attendant

    validates :user_id,:attendant_type, presence: true
    validates :user_id, uniqueness: { scope: :deleted}

    enum attendant_type: ["Atendente", "Supervisor", "Visualuzador"]

    belongs_to :user, class_name: 'Pivotal::User', required: false

    scope :by_name, ->(name) { where(user_id: name) }
    scope :by_type, ->(type) { where(attendant_type_id: type) }
    
  end
end
