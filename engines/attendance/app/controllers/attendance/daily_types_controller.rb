require_dependency 'attendance/application_controller'

module Attendance
  class DailyTypesController < ApplicationController
    before_action :set_daily_types
    before_action :set_daily_type, only: %i[edit update destroy]
    
    has_scope :by_name
    has_scope :by_status

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
      @pagy, @daily_types = pagy(apply_scopes(Attendance::DailyType).all.order(:name))
    end

    def set_daily_type
      @daily_type = Attendance::DailyType.find(params[:id])
    end

  end
end