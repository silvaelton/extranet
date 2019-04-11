require_dependency "attendance/application_controller"

module Attendance
  class AgendasController < ApplicationController
    before_action :set_agendas
    before_action :set_agenda, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @agenda = Attendance::Agenda.new
    end

    def create
      @agenda = Attendance::Agenda.new(set_params)
      @agenda.save
    end

    def edit; end

    def update
      @agenda.update(set_params)
    end

    def destroy
      @agenda.destroy
    end

    private

    def set_params
      params.require(:agenda)
            .permit(:category_id, :status, :title, :resume, :content, :started_at, 
                    :ended_at, :hour_start, :hour_end, :attendance_time, :attendance_quantity, 
                    :lunch, :lunch_hour_start, :lunch_hour_end, :lunch_attendance_quantity, 
                    :location_id, :cnpj_required, :restriction, :restriction_presence, 
                    :restriction_sql, :saturday, :saturday_hour_start, :saturday_hour_end, 
                    :saturday_attendance_quantity, :sunday, :sunday_hour_start, :sunday_hour_end, 
                    :sunday_attendance_quantity)
    end

    def set_agendas
      @pagy, @agendas = pagy(apply_scopes(Attendance::Agenda).all)
    end

    def set_agenda
      @agenda = Attendance::Agenda.find(params[:id])
    end

  end
end