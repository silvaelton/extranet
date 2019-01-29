require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketTypeUsersController < ApplicationController 
    before_action :set_ticket_type

    def new
      @ticket_type_user = @ticket_type.ticket_type_users.new
    end
    
    def create
      @ticket_type_user = @ticket_type.ticket_type_users.new(set_params)
      @ticket_type_user.user_id =  current_user.id
      @ticket_type_user.save
    end
    
    def destroy 
      @ticket_type_user = @ticket_type.ticket_type_users.find(params[:id])
      @ticket_type_user.destroy
    end

    private

    def set_params
      params.require(:ticket_type_user).permit(:staff_id)
    end

    def set_ticket_type
      @ticket_type = Helpdesk::TicketType.find(params[:ticket_type_id])
    end

  end
end