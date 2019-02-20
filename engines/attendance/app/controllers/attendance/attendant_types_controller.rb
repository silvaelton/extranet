require_dependency 'attendance/application_controller'

module Attendance
  class AttendantTypesController < ApplicationController
    before_action :set_attendant_types
    before_action :set_attendant_type, only: %i[edit update destroy]

    has_scope :by_name
		has_scope :by_status
    
    def index; end

    def new
      @attendant_type = Attendance::AttendantType.new
    end

    def create
      @attendant_type = Attendance::AttendantType.new(set_params)
      @attendant_type.save
    end

    def edit; end

    def update
      @attendant_type.update(set_params)
      @attendant_type.save
    end

    def destroy
      @attendant_type.destroy
    end

    private

    def set_params
      params.require(:attendant_type).permit(:name, :status)
    end

    def set_attendant_types
      @pagy, @attendant_types = pagy(apply_scopes(Attendance::AttendantType).all.order(:name))
    end

    def set_attendant_type
      @attendant_type = Attendance::AttendantType.find(params[:id])
    end

  end
end