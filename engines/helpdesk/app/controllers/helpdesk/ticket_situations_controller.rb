require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketSituationsController < ApplicationController
    
    def new
      @situation = Helpdesk::TicketSituation.new
    end

    def create
      @situation = Helpdesk::TicketSituation.new(set_params)
      @situation.ticket_id = @ticket.id
      @situation.user_id   = current_user.id
      @situation.valid?
    end

    private

    def set_params
      params.require(:ticket_situation)
        .permit(:content, :document, :action)
    end

    def set_ticket
      @ticket = Helpdesk::Ticket.find(params[:ticket_id])
    end
  end
end