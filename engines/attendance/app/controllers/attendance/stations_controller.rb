require_dependency 'attendance/application_controller'

module Attendance
  class StationsController < ApplicationController
    before_action :set_stations, except: %i[show]
    before_action :set_station, only: %i[edit update destroy show]

    has_scope :by_name
    has_scope :by_status
    has_scope :by_responsible
    
    def index; end

    def new
      @station = Attendance::Station.new
    end

    def create
      @station = Attendance::Station.new(set_params)
      @station.save
    end

    def edit; end

    def show
      @pagy, @attendant_stations = pagy(@station.attendant_stations.undelete_scope.where.not(deleted_at: nil), items: 4)
    end

    def update
      @station.update(set_params)
      @station.save
    end

    def destroy
      @station.destroy
    end

    private

    def set_params
      params.require(:station).permit(:responsible_id, :name, :description, :lat, :lng, :status)
    end

    def set_stations
      @pagy, @stations = pagy(apply_scopes(Attendance::Station).all.order(:name))
    end

    def set_station
      @station = Attendance::Station.find(params[:id])
    end

  end
end