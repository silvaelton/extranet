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
      params.require(:ticket).permit(:name)
    end

    def set_ticket
      @ticket = Helpdesk::Ticket.find(params[:id])
    end
      
  end
end