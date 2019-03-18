require_dependency "support/attendance/agenda_schedule"

module Attendance
  class AgendaSchedule < Support::Attendance::AgendaSchedule
    belongs_to :agenda

    validates :name, :date, :hour, :telephone, presence: true
    validates :email, email: true, presence: true
    validates :cpf, cpf: true, presence: true, if: -> { !agenda.cnpj_required? }
    validates :cnpj, cnpj: true, presence: true, if: -> { agenda.cnpj_required? }
  end
end