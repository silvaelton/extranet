require_dependency 'sefaz/application_controller'

module Sefaz
  class ExemptionTypesController < ApplicationController # :nodoc:
    before_action :set_exemption_types
    before_action :set_exemption_type, only: %i[edit update destroy]

    def index; end

    def new
      @exemption_type = Sefaz::ExemptionType.new
    end

    def create
      @exemption_type = Sefaz::ExemptionType.new(set_params)
      @exemption_type.save
    end

    def edit; end

    def update
      @exemption_type.update(set_params)
    end

    def destroy
      @exemption_type.destroy
    end

    private

    def set_params
      params.require(:exemption_type).permit(:name, :status)
    end

    def set_exemption_types
      @exemption_types = Sefaz::ExemptionType.all
    end

    def set_exemption_type
      @exemption_type = Sefaz::ExemptionType.find(params[:id])
    end
  end
end
