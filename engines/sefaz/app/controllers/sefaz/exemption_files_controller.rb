require_dependency 'sefaz/application_controller'

module Sefaz
  class ExemptionFilesController < ApplicationController # :nodoc:
    before_action :set_allotment

    def new
      @exemption_file = Sefaz::ExemptionFile.new
    end

    def create
      @exemption_file = Sefaz::ExemptionFile.new(set_params)
      @exemption_file.user_id = current_user.id
      @exemption_file.allotment_id = @allotment.id
      @service = Sefaz::ImportFileService.new(@exemption_file)
			@service.import_files!
			@allotment.update(request_situation_id: 2)		
    end

    private

    def set_params
      params.require(:exemption_file).permit(:attachment)
    end

    def set_allotment
      @allotment = Sefaz::Allotment.find(params[:allotment_id])
      @exemptions = @allotment.exemptions
    end
  end
end
