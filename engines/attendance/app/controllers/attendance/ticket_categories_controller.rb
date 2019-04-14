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
      params.require(:ticket_category)
            .permit(:name, :status, :due, :unique, :started_at, :ended_at, 
                    :filter_situation, :filter_situation_id, :filter_convocation, 
                    :filter_convocation_id, :filter_program, :filter_program_id, 
                    :filter_sub_program, :filter_sub_program_id, :filter_sql, :filter_sql_content)
    end

    def set_ticket_categories
      @pagy, @ticket_categories = pagy(apply_scopes(Attendance::TicketCategory).all.order(:id))
    end

    def set_ticket_category
      @ticket_category = Attendance::TicketCategory.find(params[:id])
    end

  end
end