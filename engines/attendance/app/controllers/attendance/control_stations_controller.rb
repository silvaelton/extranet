require_dependency 'attendance/application_controller'

module Attendance
  class ControlStationsController < ApplicationController

    def new
      @control_station = Attendance::ControlStation.new
      @control_station.situation = params[:situation]
    end

    def create
      @control_station = Attendance::ControlStation.new(set_params)
      @control_station.attendant_id = current_user.id
      @control_station.save
    end

    private

    def set_params
      params.require(:control_station).permit(:attendant_id, :station_id, :situation)
    end

  end
end