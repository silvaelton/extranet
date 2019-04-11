require_dependency "helpdesk/application_controller"

module Helpdesk
  class TicketLocationsController < ApplicationController
    before_action :set_ticket_locations
    before_action :set_ticket_location, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @ticket_location = Helpdesk::TicketLocation.new
    end

    def create
      @ticket_location = Helpdesk::TicketLocation.new(set_params)
      @ticket_location.save
    end

    def edit; end

    def update
      @ticket_location.update(set_params)
    end

    def destroy
      @ticket_location.destroy
    end

    private

    def set_params
      params.require(:ticket_location).permit(:name, :status, :lat, :lng)
    end

    def set_ticket_locations
      @pagy, @ticket_locations = pagy(apply_scopes(Helpdesk::TicketLocation).all.order(:id))
    end

    def set_ticket_location
      @ticket_location = Helpdesk::TicketLocation.find(params[:id])
    end

  end
end