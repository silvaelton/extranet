require_dependency "helpdesk/application_controller"

module Helpdesk
  class TicketSituationTypesController < ApplicationController
    
    def index
      @ticket_situation_types = Helpdesk::TicketSituationType.all
    end

  end
end