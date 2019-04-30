module Helpdesk
  class TicketSchedulesController < ApplicationController
    before_action :set_ticket 

    def new
      @ticket_schedule = Helpdesk::TicketSchedule.new
    end
    
    def new
      @ticket_schedule = Helpdesk::TicketSchedule.new
      @ticket_schedule.user_id    = current_user.id 
      @ticket_schedule.ticket_id  = @ticket.id
      @ticket_schedule.save
    end

    private

    def set_params
      params.require(:ticket_schedule).permit(:schedule_date, :schedule_hour)
    end

    def set_ticket
      @ticket = Helpdesk::Ticket.find_by(id: params[:ticket_id])
    end

  end
end