require_dependency 'attendance/application_controller'

module Attendance
  class TicketCategoryStepsController < ApplicationController
    before_action :set_ticket_category
    before_action :set_category_steps
    before_action :set_category_step, only: %i[edit update destroy show]
    
    has_scope :by_name
    has_scope :by_status

    def new
      @category_step = @ticket_category.ticket_category_steps.new
    end

    def create
      @category_step = @ticket_category.ticket_category_steps.new(set_params)
      @category_step.save
    end
    
    def edit; end

    def show
      @step_document = @category_step.step_documents.new
    end
    
    def documentation; end

    def update
      @category_step.update(set_params)
    end
    
    def destroy
      @category_step.destroy
    end

    private

    def set_params
      params.require(:ticket_category_step).permit(:ticket_category_id, :name, :resume, :document_required, :step_required, :view_form,
                                            :screen_order, :message_success, :message_pendent, :allow_confirmation, :status)
    end

    def set_category_step
      @category_step = @ticket_category.ticket_category_steps.find(params[:id])
    end

    def set_category_steps
      @category_steps = apply_scopes(@ticket_category.ticket_category_steps).all.order(:name)
    end

    def set_ticket_category
      @ticket_category = Attendance::TicketCategory.find(params[:ticket_category_id])
    end

  end
end