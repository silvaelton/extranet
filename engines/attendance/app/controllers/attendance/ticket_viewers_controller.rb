require_dependency 'attendance/application_controller'

module Attendance
  class TicketViewersController < ApplicationController
    before_action :set_ticket

    def show 
      if @ticket_viewr.viewer 
        @ticket_viewr.update(viewer: false, viewer_id: nil)
      else 
        @ticket_viewr.update(viewer: true, viewer_id: current_user.id)
      end

      @ticket =  Attendance::Ticket.find(params[:ticket_id])
    end

    private

    def set_ticket
      @ticket_viewr = Attendance::TicketViewer.find(params[:ticket_id])
      
    end

  end 
end