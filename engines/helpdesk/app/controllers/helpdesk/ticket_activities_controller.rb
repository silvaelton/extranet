require_dependency "helpdesk/application_controller"

module Helpdesk
  class TicketActivitiesController < ApplicationController
    before_action :set_ticket

    def create
      @ticket_activity = @ticket.ticket_activities.new(set_params)
      @ticket_activity.attendant = (@ticket.user_id == current_user.id) ? false : true
      @ticket_activity.user_id   = current_user.id
      
      if @ticket_activity.save
        @ticket_activity = @ticket.ticket_activities.new
      end 
    end

    private

    def set_params
      params.require(:ticket_activity)
        .permit(:content, :document)
    end

    def set_ticket
      @ticket = Helpdesk::Ticket.find(params[:ticket_id]) 
    end
  end
end