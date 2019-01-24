require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketCategoriesController < ApplicationController 
    before_action :set_ticket_category, only: [:edit, :update, :destroy]
    
    def index
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_params
      params.require(:ticket_category).permit(:name, :status)
    end

    def set_ticket_category
      @ticket_category = Helpdesk::TicketCategory.find(params[:id])
    end
  end
end
    