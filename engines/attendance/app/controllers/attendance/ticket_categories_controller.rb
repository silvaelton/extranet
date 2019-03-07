require_dependency 'attendance/application_controller'

module Attendance
  class TicketCategoriesController < ApplicationController
    before_action :set_ticket_categories
    before_action :set_ticket_category, only: %i[edit update destroy show]
    
    has_scope :by_name
    has_scope :by_status

    def index; end

    def new
      @ticket_category = Attendance::TicketCategory.new
    end

    def create
      @ticket_category = Attendance::TicketCategory.new(set_params)
      @ticket_category.save
    end

    def edit; end
    
    def show; end

    def update
      @ticket_category.update(set_params)
      @ticket_category.save
    end

    def destroy
      @ticket_category.destroy
    end

    private

    def set_params
      params.require(:ticket_category).permit(:name, :status, :description, :observation, :label,
                                            :code, :help_text, :sei_tranning_id, :sei_production_id)
    end

    def set_ticket_categories
      @pagy, @ticket_categories = pagy(apply_scopes(Attendance::TicketCategory).all.order(:name))
    end

    def set_ticket_category
      @ticket_category = Attendance::TicketCategory.find(params[:id])
    end

  end
end