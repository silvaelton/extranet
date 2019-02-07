require_dependency 'attendance/application_controller'

module Attendance
  class DailyPreferentialTypesController < ApplicationController
    before_action :set_daily_preferential_types
    before_action :set_daily_preferential_type, only: %i[edit update destroy]
    
    def index; end

    def new
      @daily_preferential_type = Attendance::DailyPreferentialType.new
    end

    def create
      @daily_preferential_type = Attendance::DailyPreferentialType.new(set_params)
      @daily_preferential_type.save
    end

    def edit; end

    def update
      @daily_preferential_type.update(set_params)
      @daily_preferential_type.save
    end

    def destroy
      @daily_preferential_type.destroy
    end

    private

    def set_params
      params.require(:daily_preferential_type).permit(:name, :status, :description)
    end

    def set_daily_preferential_types
      @daily_preferential_types = Attendance::DailyPreferentialType.all
    end

    def set_daily_preferential_type
      @daily_preferential_type = Attendance::DailyPreferentialType.find(params[:id])
    end

  end
end