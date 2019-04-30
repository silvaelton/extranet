require_dependency 'support/attendance/requeriment_category'

module Attendance
  class RequerimentCategory < Support::Attendance::RequerimentCategory
    validates :name, :description, presence: true
    validates :program_id, presence: true, if: -> { !self.outside_cadastre? }
    validates :situation_id, presence: true, if: -> { self.situation? }

    def program_id=(value) 
      self[:program_id] = value.split(',')
    end

    def program_id
      self[:program_id].to_a.join(',')
    end

    def situation_id=(value) 
      self[:situation_id] = value.split(',')
    end

    def situation_id
      self[:situation_id].to_a.join(',')
    end
  end
end