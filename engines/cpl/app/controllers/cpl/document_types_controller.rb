require_dependency 'cpl/application_controller'

module Cpl
  class DocumentTypesController < ApplicationController # :nodoc:
    before_action :set_document_types
    before_action :set_document_type, only: %i[edit update destroy]

    def index; end

    def new
      @document_type = Cpl::DocumentType.new
    end

    def create
      @document_type = Cpl::DocumentType.new(set_params)
      @document_type.staff_id = current_user.id
      @document_type.save
    end

    def edit; end

    def update
      @document_type.update(set_params)
    end

    def destroy
      @document_type.destroy
    end

    private

    def set_params
      params.require(:document_type).permit(:name, :status)
    end

    def set_document_types
      @document_types = Cpl::DocumentType.all
    end

    def set_document_type
      @document_type = Cpl::DocumentType.find(params[:id])
    end
  end
end
