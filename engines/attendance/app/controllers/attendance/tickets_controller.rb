require_dependency 'attendance/application_controller'

module Attendance
  class TicketsController < ApplicationController

    def index
    end

    def new
      @ticket_create = Attendance::TicketCreate.new
    end
    
    def create
      @ticket_create = Attendance::TicketCreate.new(set_create_params)
      @ticket_create.valid?
    end

    private

    def set_create_params
      params.require(:ticket_create).permit(:cpf, :ticket_category_id)
    end

  end
end