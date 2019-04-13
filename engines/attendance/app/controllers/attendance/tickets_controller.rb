require_dependency 'attendance/application_controller'

module Attendance
  class TicketsController < ApplicationController

    def index
      @pagy, @tickets = pagy(apply_scopes(Attendance::Ticket).all) 
    end

    def show
      @ticket = Attendance::Ticket.find(params[:id])
    end

    private

    def set_create_params
      params.require(:ticket_create).permit(:cpf, :ticket_category_id)
    end

  end
end