require_dependency "support/attendance/agenda"

module Attendance
  class Agenda < Support::Attendance::Agenda

    has_many :agenda_schedules
    
    validates :category_id, :title, :resume, :started_at, :ended_at, :hour_start, :hour_end, presence: true
    validates :attendance_time, :attendance_quantity, presence: true, numericality: true

    validates :lunch_hour_start, :lunch_hour_end, presence: true, if: -> { self.lunch? }
    validates :lunch_attendance_quantity, numericality: true, presence: true, if: -> { self.lunch? } 

    validates :saturday_hour_start, :saturday_hour_end, presence: true, if: -> { self.saturday? }
    validates :saturday_attendance_quantity, numericality: true, presence: true, if: -> { self.saturday? } 

    validates :sunday_hour_start, :sunday_hour_end, presence: true, if: -> { self.sunday? }
    validates :sunday_attendance_quantity, numericality: true, presence: true, if: -> { self.sunday? } 
    
    validates :restriction_sql, presence: true, if: -> { self.restriction? }
  end
end