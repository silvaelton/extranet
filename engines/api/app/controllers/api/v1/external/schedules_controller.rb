require_dependency 'api/application_controller'

module Api
  module V1
    module External
      class SchedulesController < ApplicationController
        
        # GET [:agenda_id, :date]

        def times
          @agenda = Api::Attendance::Agenda.find(params[:agenda_id])
          @times  = @agenda.times(params[:date])
        end

      end
    end
  end
end