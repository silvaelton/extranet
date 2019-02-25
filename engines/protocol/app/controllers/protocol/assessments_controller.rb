require_dependency 'protocol/application_controller'

module Protocol
  class AssessmentsController < ApplicationController
    def index
      @pagy, @assessments = pagy(Protocol::Assessment.all)
    end

    def show
      @assessment = Protocol::Assessment.find(params[:id])
      @conduct = @assessment.conducts.all.order(created_at: :desc)
      @digital_docs = @assessment.digital_documents.all
      @locations = @assessment.locations.all
      @attach_document = @assessment.attach_documents.all
      @attach_child = Protocol::AttachDocument.where(document_child_id: @assessment.id).first
    end
  end
end
