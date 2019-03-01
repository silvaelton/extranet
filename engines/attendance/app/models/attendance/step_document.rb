require_dependency 'support/attendance/step_document'

module Attendance
  class StepDocument < Support::Attendance::StepDocument
    belongs_to :category_step, class_name: 'Attendance::TicketCategoryStep'

    validates :category_step_id, presence: true
    
    scope :by_name,    ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,  ->(status) { where(status: status) }
    
  end
end
