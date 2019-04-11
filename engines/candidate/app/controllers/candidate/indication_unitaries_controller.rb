require_dependency "candidate/application_controller"

module Candidate
  class IndicationUnitariesController < ApplicationController
    before_action :set_cadastre

    def new
      @indication_unitary = @cadastre.indication_unitaries.new
    end

    def create
      @indication_unitary = @cadastre.indication_unitaries.new(set_params)
      @indication_unitary.user_id = current_user.id
      @indication_unitary.save
    end

    private

    def set_params
      params.require(:indication_unitary).permit(:enterprise_id, :justify)
    end

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
    end
  end
end
