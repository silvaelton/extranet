require_dependency 'attendance/application_controller'

module Attendance
  class TicketSituationTypesController < ApplicationController
    before_action :set_situation_types
    before_action :set_situation_type, only: %i[edit update destroy]
    
    has_scope :by_name
    has_scope :by_status

    def index; end

    def new
      @situation_type = Attendance::TicketSituationType.new
    end

    def create
      @situation_type = Attendance::TicketSituationType.new(set_params)
      @situation_type.save
    end

    def edit; end

    def update
      @situation_type.update(set_params)
      @situation_type.save
    end

    def destroy
      @situation_type.destroy
    end

    private

    def set_params
      params.require(:ticket_situation_type).permit(:name, :status, :code, :label_view_candidate)
    end

    def set_situation_types
      @pagy, @situation_types = pagy(apply_scopes(Attendance::TicketSituationType).all.order(:id))
    end

    def set_situation_type
      @situation_type = Attendance::TicketSituationType.find(params[:id])
    end

  end
end