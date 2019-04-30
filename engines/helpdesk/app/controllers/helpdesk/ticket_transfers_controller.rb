module Helpdesk
  class TicketTransfersController < ApplicationController
    before_action :set_ticket
    before_action :set_tickets, only: :create

    def new
      @ticket_transfer = Helpdesk::TicketTransfer.new
      @ticket_transfer.ticket_id   = @ticket.id
      @ticket_transfer.user_id     = current_user.id
      @ticket_transfer.set_values
    end
    
    def create
      @ticket_transfer = Helpdesk::TicketTransfer.new(set_params)
      @ticket_transfer.ticket_id   = @ticket.id
      @ticket_transfer.user_id     = current_user.id
      @ticket_transfer.save
    end

    private

    def set_params
      params.require(:ticket_transfer).permit(:ticket_type_id, :ticket_subject_id)
    end

    def set_ticket
      @ticket = Helpdesk::Ticket.find(params[:ticket_id])
    end

    def set_tickets
      @tickets_all = apply_scopes(Helpdesk::Ticket.by_current_user(current_user)).order(created_at: :desc)
      @pagy, @tickets = pagy(@tickets_all)
    end
  end
end