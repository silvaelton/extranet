require_dependency 'attendance/application_controller'

module Attendance
  class AttendantsController < ApplicationController
    before_action :set_attendants
    before_action :set_attendant, only: %i[edit update destroy]

    has_scope :by_name
    has_scope :by_type
    
    def index; end

    def new
      @attendant = Attendance::Attendant.new
    end

    def create
      @attendant = Attendance::Attendant.new(set_params)
      @attendant.creator_id = current_user.id
      @attendant.save
    end

    def edit; end

    def update
      @attendant.update(set_params)
      @attendant.save
    end

    def destroy
      @attendant.destroy
    end

    private

    def set_params
      params.require(:attendant).permit(:creator_id, :staff_id, :attendant_type_id, :creator_id)
    end

    def set_attendants
      @pagy, @attendants = pagy(apply_scopes(Attendance::Attendant).all.order(:id))
    end

    def set_attendant
      @attendant = Attendance::Attendant.find(params[:id])
    end

  end
end