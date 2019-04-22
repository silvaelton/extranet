require_dependency 'address/application_controller'

module Address
  class OfficesController < ApplicationController
    before_action :set_unit,  only: %i[edit update]

    def edit; end

    def update
      @unit.update(set_params)
    end


    private

    def set_params
      params.require(:unit).permit(:unit_code, :notary_office, :contract_date, :code_date, :contract_office,
                                   :petition_date, :signature_date, :anoreg_date, :devolution_date, :requirement,
                                   :requirement_date, :declaratory_act_number, :declaratory_act_date, :rejection_number,
                                   :rejection_date, :endorsement)
    end

    def set_unit
      @unit = Address::Unit.find(params[:id])
    end
  end
end
