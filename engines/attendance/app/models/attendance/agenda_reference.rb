require_dependency "support/attendance/agenda_reference"

module Attendance
  class AgendaReference < Support::Attendance::AgendaReference
    
    scope :by_cpf, -> (value) { where(cpf: value.to_s.unformat_cpf )}
    
    validates :cpf, cpf: true, presence: true
    validates_uniqueness_of :cpf, scope: :category_id, conditions: -> { not_deleted }


  end
end