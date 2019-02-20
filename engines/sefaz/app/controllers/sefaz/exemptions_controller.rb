require_dependency 'sefaz/application_controller'

module Sefaz
  class ExemptionsController < ApplicationController # :nodoc:
    before_action :set_allotment
    before_action :set_exemptions
    before_action :set_exemption, only: %i[edit update destroy]

    def index; end

    def new
      @exemption = @allotment.exemptions.new
    end

    def create
      @exemption = @allotment.exemptions.new(set_params)
      @exemption.user_id = current_user.id
      @exemption.save
    end

    def edit; end

    def update
      @exemption.update(set_params)
    end

    def destroy
      @exemption.destroy
    end

    private

    def set_params
      params.require(:exemption).permit(:name, :cpf, :city, :address, :realty_number
                                        :realty_value)
    end

    def set_exemptions
      @exemptions = @allotment.exemptions.all
    end

    def set_exemption
      @exemptions = @allotment.exemptions.find(params[:id])
    end

    def set_allotment
      @allotment = Sefaz::Allotment.find(params[:allotment_id])
    end
  end
end
