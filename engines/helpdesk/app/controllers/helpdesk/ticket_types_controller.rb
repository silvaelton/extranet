require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketTypesController < ApplicationController 
    before_action :set_ticket_types
    before_action :set_ticket_type, only: [:show, :edit, :update, :destroy]

    def index; end

    def show; end

    def subject
      @ticket_subjects = Helpdesk::TicketTypeSubject.where(ticket_type_id: params[:by_type_id])
    end

    def new
      @ticket_type = Helpdesk::TicketType.new
    end
    
    def create
      @ticket_type = Helpdesk::TicketType.new(set_params)
      @ticket_type.save
    end
    
    def edit; end
    
    def update
      @ticket_type.update(set_params)
    end

    def destroy
      @ticket_type.destroy
    end

    private

    def set_params
      params.require(:ticket_type).permit(:name, :status)
    end

    def set_ticket_types
      @ticket_types = Helpdesk::TicketType.all.order(:name)
    end

    def set_ticket_type
      @ticket_type = Helpdesk::TicketType.find(params[:id])
    end
  end
end
    