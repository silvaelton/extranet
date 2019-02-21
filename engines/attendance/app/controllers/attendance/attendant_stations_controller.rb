require_dependency 'attendance/application_controller'

module Attendance
  class AttendantStationsController < ApplicationController
    before_action :set_station

    has_scope :by_attendant
    
    def new
      @attendant_station = @station.attendant_stations.new
    end

    def create
      @attendant_station = @station.attendant_stations.new(set_params)
      @attendant_station.creator_id = current_user.id
      @attendant_station.save
    end

    def destroy
      @attendant_station = @station.attendant_stations.find(params[:id])
      @attendant_station.destroy
    end

    private

    def set_params
      params.require(:attendant_station).permit(:attendant_id, :station_id, :creator_id)
    end

    def set_station
      @station = Attendance::Station.find(params[:station_id])
    end

  end
end