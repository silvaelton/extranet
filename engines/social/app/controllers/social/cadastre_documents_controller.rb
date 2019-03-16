require_dependency 'social/application_controller'

module Social
  class CadastreDocumentsController < ApplicationController
    before_action :set_cadastre

    def new
      @document = @cadastre.cadastre_documents.new
    end

    def create
      @document = @cadastre.cadastre_documents.new(set_params)
      @document.user_id = current_user.id
      @document.save
    end

    def destroy
      @document = Social::CadastreDocument.find(params[:id])
      @document.destroy
    end

    private

    def set_params
      params.require(:cadastre_document).permit(:document_type_id, :attachment)
    end

    def set_cadastre
      @cadastre = Social::Cadastre.find(params[:cadastre_id])
    end
  end
end
