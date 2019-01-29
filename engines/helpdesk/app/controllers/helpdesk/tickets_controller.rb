require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketsController < ApplicationController 
    before_action :set_ticket, only: [:edit, :update, :destroy]

    def index
      @tickets = Helpdesk::Ticket.all
    end
    
    def show
      @ticket = Helpdesk::Ticket.find(params[:id])
    end
    
    def new
      @ticket = Helpdesk::Ticket.new
    end
    
    def create
      @ticket = Helpdesk::Ticket.new(set_params)
      @ticket.staff_id = current_user.id
      @ticket.save
    end

    def edit;end

    def update
      @ticket.update(set_params)
    end
    
    def destroy
      @ticket.destroy
    end

    private

    def set_params
      params.require(:ticket)
        .permit(:ticket_type_id, :subject_id, :description, :schedule, :schedule_date, :schedule_hour, :contact, :location_id)
    end

    def set_ticket
      @ticket = Helpdesk::Ticket.find(params[:id])
    end
      
  end
end