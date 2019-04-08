require_dependency 'support/attendance/requeriment_category'

module Attendance
  class RequerimentCategory < Support::Attendance::RequerimentCategory
    validates :name, :description, presence: true
    validates :program_id, presence: true, if: -> { self.program }
    
    def program_id=(value) 
      self[:program_id] = value.split(',')
    end

    def program_id
      self[:program_id].to_a.join(',')
    end
  end
end