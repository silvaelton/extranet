require_dependency 'attendance/application_controller'

module Attendance
  class StepDocumentsController < ApplicationController
    before_action :set_ticket_category
    before_action :set_category_step
    before_action :set_step_document, only: %i[edit update destroy show]
    
    has_scope :by_name
    has_scope :by_status

    def new
      @step_document = @category_step.step_documents.new
    end

    def create
      @step_document = @category_step.step_documents.new(set_params)
      @step_document.save
    end

    def edit; end

    def show; end

    def update
      @step_document.update(set_params)
      @step_document.save
    end

    def destroy
      @step_document.destroy
    end

    private

    def set_params
      params.require(:step_document).permit(:category_step_id, :document_type_id)
    end

    def set_category_step
      @category_step = @ticket_category.ticket_category_steps.find(params[:ticket_category_step_id])
    end

    def set_ticket_category
      @ticket_category = Attendance::TicketCategory.find(params[:ticket_category_id])
    end

    def set_step_document
      @step_document = @category_step.step_documents.find(params[:id])
    end

  end
end