require_dependency 'attendance/application_controller'

module Attendance
  class AgendaSchedulesController < ApplicationController
    before_action :set_agenda
    
    def index
    end

    def new
      @schedule = @agenda.agenda_schedules.new
    end
    
    def create
      @schedule = @agenda.agenda_schedules.new(set_params)
      @schedule.save
    end

    def edit 
    end

    def update
    end 

    def destroy
    end

    private

    def set_params
      params.require(:agenda_schedule).permit(:name)
    end

    def set_agenda
      @agenda = Attendance::Agenda.find(params[:agenda_id])
    end
    
  end
end