require_dependency 'support/attendance/ticket_category_step'

module Attendance
  class TicketCategoryStep < Support::Attendance::TicketCategoryStep

    validates :name, :view_form, :resume, presence: true

    belongs_to :ticket_category, class_name: 'Attendance::TicketCategory'

    has_many :step_documents, foreign_key: :category_step_id
    
    scope :by_name,    ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,  ->(status) { where(status: status) }

    def self.view_forms
      %w(
        cadastre
        dependent
        income
        contact
        registry
      )
    end
  end
end
