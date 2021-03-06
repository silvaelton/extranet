require_dependency 'support/attendance/document_type'

module Attendance
  class DocumentType < Support::Attendance::DocumentType

    validates :name, presence: true
    
    scope :by_name,    ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,  ->(status) { where(status: status) }
    
  end
end
