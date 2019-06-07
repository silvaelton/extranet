require_dependency 'attendance/application_controller'

module Attendance
  class TicketCategoryTermsController < ApplicationController
    before_action :set_ticket
    before_action :set_ticket_category_terms

    def new 
      @ticket_category_term = @ticket_category.ticket_category_terms.new
    end
    
    def create
      @ticket_category_term = @ticket_category.ticket_category_terms.new(set_params)
      @ticket_category_term.save
    end

    def destroy
      @ticket_category_term = @ticket_category.ticket_category_terms.find(params[:id])
      @ticket_category_term.destroy
    end

    private
    
    def set_ticket
      @ticket_category = Attendance::TicketCategory.find(params[:ticket_category_id])
    end
    
    def set_ticket_category_terms
      @ticket_category_terms = @ticket_category.ticket_category_terms
    end

    def set_params 
      params.require(:ticket_category_term).permit(:term_id)
    end
  end
end