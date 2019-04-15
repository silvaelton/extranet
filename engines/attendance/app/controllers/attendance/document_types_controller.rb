require_dependency 'attendance/application_controller'

module Attendance
  class DocumentTypesController < ApplicationController
    before_action :set_document_types
    before_action :set_document_type, only: %i[edit update destroy]
    
    has_scope :by_name
    has_scope :by_status

    def index; end

    def new
      @document_type = Attendance::DocumentType.new
    end

    def create
      @document_type = Attendance::DocumentType.new(set_params)
      @document_type.save
    end

    def edit; end

    def update
      @document_type.update(set_params)
      @document_type.save
    end

    def destroy
      @document_type.destroy
    end

    private

    def set_params
      params.require(:document_type).permit(:name, :status, :description, :observation, :label,
                                            :code, :help_text, :sei_tranning_id, :sei_production_id, :min_file)
    end

    def set_document_types
      @document_types = apply_scopes(Attendance::DocumentType).all.order(code: :asc)
    end

    def set_document_type
      @document_type = Attendance::DocumentType.find(params[:id])
    end

  end
end