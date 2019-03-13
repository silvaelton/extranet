require_dependency 'social/application_controller'

module Social
  class DocumentTypesController < ApplicationController
    before_action :set_document_types
    before_action :set_document_type, only: %i[edit update destroy show]

    def index; end

    def new
      @document_type = Social::DocumentType.new
    end

    def create
      @document_type = Social::DocumentType.new(set_params)
      @document_type.save
    end

    def edit; end

    def update
      @document_type.update(set_params)
    end

    def destroy
      @document_type.destroy
    end

    def show; end

    private

    def set_params
      params.require(:document_type).permit(:name, :status)
    end

    def set_document_types
       @document_types = Social::DocumentType.all
    end

    def set_document_type
      @document_type = Social::DocumentType.find(params[:id])
    end
  end
end
