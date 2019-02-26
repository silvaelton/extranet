require_dependency 'protocol/application_controller'

module Protocol
  class AssessmentsController < ApplicationController
    has_scope :by_process
    has_scope :by_document_type
    has_scope :by_cpf
    has_scope :by_cnpj
    has_scope :by_subject
    has_scope :by_sector
    has_scope :by_recipient
    has_scope :by_start_date
    has_scope :by_end_date
    has_scope :by_external

    def index
      @pagy, @assessments = pagy(apply_scopes(Protocol::Assessment.all))
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
