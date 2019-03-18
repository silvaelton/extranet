require_dependency 'support/attendance/agenda'

module Api
  module Attendance
    class Agenda < Support::Attendance::Agenda 
      
      def times(date)
        return false if !date.present?

        hour_array      = Array.new
        lunch_array     = Array.new
        sunday_array    = Array.new
        saturday_array  = Array.new

        start_hour  = self.hour_start
        last_hour   = self.hour_end  - self.attendance_time.minutes

        if lunch_present?
          lunch_start = self.lunch_hour_start
          lunch_end   = self.lunch_hour_end - attendance_time.minutes
    
          time_iterate(lunch_start, lunch_end, attendance_time.minutes)  { |t| lunch_array.push t.strftime('%H:%M') }
        end
      
        if sunday_present?
          sunday_start = self.sunday_hour_start
          sunday_end   = self.sunday_hour_end

          time_iterate(sunday_start, sunday_end, attendance_time.minutes)  { |t| sunday_array.push t.strftime('%H:%M') }
        end

            
        if saturday_present?
          saturday_start = self.saturday_hour_start
          saturday_end   = self.saturday_hour_end

          time_iterate(saturday_start, saturday_end, attendance_time.minutes)  { |t| saturday_array.push t.strftime('%H:%M') }
        end

        time_iterate(start_hour, last_hour, attendance_time.minutes)      { |t| hour_array.push t.strftime('%H:%M') } 

        attendance_iterate(hour_array, 
                          lunch_array, 
                          sunday_array, 
                          saturday_array, 
                          self.attendance_quantity, 
                          self.lunch_attendance_quantity, 
                          self.sunday_attendance_quantity, 
                          self.saturday_attendance_quantity, 
                          date)
      end

      private

      def attendance_iterate(hour = [], lunch = [], sunday_array = [], saturday_array = [], attendant = 0, 
                            lunch_attendant = 0, sunday_attendant, saturday_attendant, date)
      
        date = Date.parse(date) if date.is_a?(String)
      
        empty_message = 'Indisponível'

        Array.new(hour.count) do |i|
          
          case date.wday
          when 0
            if sunday_present?
              if sunday_array.include? hour[i]
                (schedules_time(hour[i], date) >= self.sunday_attendance_quantity) ? 'indisponível' : hour[i]
              else 
                empty_message
              end
            else 
              empty_message
            end
          when 6
            if saturday_present?
              if saturday_array.include? hour[i]
                (schedules_time(hour[i], date) >= self.saturday_attendance_quantity) ? 'indisponível' : hour[i]
              else 
                empty_message
              end
            else
              empty_message
            end 
          else  
            if lunch.include? hour[i]
              (schedules_time(hour[i], date) >= self.lunch_attendance_quantity) ? 'indisponível' : hour[i]
            else
              (schedules_time(hour[i], date) >= self.attendance_quantity) ? 'indisponível' : hour[i]
            end
          end
        end

      end

      def time_iterate(start_time, end_time, step, &block)
        begin
          yield(start_time)
        end while (start_time += step) <= end_time
      end

      def schedules_time(time,date)
        agenda_schedules.where(hour: time, date: date, situation_id: 1).count
      end

      def lunch_present?
        self.lunch
      end
      
      def restriction_present?
        self.restriction
      end

      def saturday_present?
        self.saturday
      end
      
      def sunday_present?
        self.sunday
      end

    end
  end 
end 