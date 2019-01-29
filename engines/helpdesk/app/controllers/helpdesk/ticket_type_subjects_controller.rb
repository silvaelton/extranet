require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketTypeSubjectsController < ApplicationController 
    before_action :set_ticket_type
    before_action :set_ticket_type_subject, only: [:destroy, :edit, :update]

    def new
      @ticket_type_subject = @ticket_type.ticket_type_subjects.new
    end
    
    def create
      @ticket_type_subject = @ticket_type.ticket_type_subjects.new(set_params)
      @ticket_type_subject.save
    end

    def edit;end

    def update
      @ticket_type_subject.update(set_params)
    end
    
    def destroy 
      @ticket_type_subject = @ticket_type.ticket_type_subjects.find(params[:id])
      @ticket_type_subject.destroy
    end
    
    private
    
    def set_ticket_type_subject
      @ticket_type_subject = @ticket_type.ticket_type_subjects.find(params[:id])
    end

    def set_params
      params.require(:ticket_type_subject).permit(:name, :status)
    end

    def set_ticket_type
      @ticket_type = Helpdesk::TicketType.find(params[:ticket_type_id])
    end

  end
end