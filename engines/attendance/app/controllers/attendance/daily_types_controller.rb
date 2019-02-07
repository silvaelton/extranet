require_dependency 'attendance/application_controller'

module Attendance
  class DailyTypesController < ApplicationController
    before_action :set_daily_types
    before_action :set_daily_type, only: %i[edit update destroy]
    
    def index; end

    def new
      @daily_type = Attendance::DailyType.new
    end

    def create
      @daily_type = Attendance::DailyType.new(set_params)
      @daily_type.save
    end

    def edit; end

    def update
      @daily_type.update(set_params)
      @daily_type.save
    end

    def destroy
      @daily_type.destroy
    end

    private

    def set_params
      params.require(:daily_type).permit(:name, :status, :description)
    end

    def set_daily_types
      @daily_types = Attendance::DailyType.all
    end

    def set_daily_type
      @daily_type = Attendance::DailyType.find(params[:id])
    end

  end
end