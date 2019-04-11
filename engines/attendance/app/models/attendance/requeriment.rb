require_dependency 'support/attendance/requeriment'

module Attendance
  class Requeriment < Support::Attendance::Requeriment
    has_many :requeriment_attachments
    belongs_to :requeriment_category
  end
end