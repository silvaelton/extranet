require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketsController < ApplicationController 
    before_action :set_ticket, only: [:edit, :update, :destroy]
    before_action :set_tickets

    has_scope :by_id
    has_scope :by_category_type
    has_scope :by_category
    has_scope :by_type
    has_scope :by_situation
    has_scope :by_requester_id
    has_scope :by_attendant_id
    
    def index; end
    
    def show
      @ticket = Helpdesk::Ticket.find(params[:id])
      @ticket_activity = @ticket.ticket_activities.new
    end
    
    def new
      @ticket = Helpdesk::Ticket.new
    end
    
    def create
      @ticket = Helpdesk::Ticket.new(set_params)
      @ticket.user_id = current_user.id
      @ticket.save
    end

    def edit;end

    def update
      @ticket.update(set_params)
    end
    
    def destroy
      @ticket.destroy
    end

    def answer
      @ticket = Helpdesk::Ticket.find(params[:ticket_id])
      @ticket.set_answer!(current_user.id)
    end

    private

    def set_params
      params.require(:ticket)
        .permit(:ticket_type_id, :subject_id, :description, :schedule, 
                :schedule_date, :schedule_hour, :contact, :location_id,
                ticket_attachments_attributes: [:document, :id, :_destroy])
    end

    def set_ticket
      @ticket = Helpdesk::Ticket.find(params[:id])
    end

    def set_tickets
      @tickets_all = apply_scopes(Helpdesk::Ticket.by_current_user(current_user)).order(created_at: :desc)
      @pagy, @tickets = pagy(@tickets_all)
    end
      
  end
end