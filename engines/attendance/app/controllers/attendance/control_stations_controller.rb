require_dependency 'attendance/application_controller'

module Attendance
  class ControlStationsController < ApplicationController
    before_action :set_station

    def index
    end
 
    def update_control
      @station =  Attendance::ControlStation.where(station_id: params[:station_id]).last

      @control_station = Attendance::ControlStation.new
      @control_station.attendant_id = current_user.id
      @control_station.station_id = params[:station_id]

      if @station.present? && @station.status == true
        @control_station.status = false
      else
        @control_station.status = true
      end 

      @control_station.save
    end

    private

    def set_params
      params.require(:control_station).permit(:attendant_id, :station_id, :status)
    end

    def set_station
      @stations = Attendance::Station.where(id: current_attendat_stations.map(&:station_id))
    end
  end
end