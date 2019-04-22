require_dependency 'address/application_controller'

module Address
  class UnitDetailsController < ApplicationController
    before_action :set_unit,  only: %i[edit update]

    def edit; end

    def update
      @unit.update(set_params)
    end

    private

    def set_params
      params.require(:unit).permit(:area_front, :area_back, :area_right, :area_left, :limit_front,
                                   :limit_back, :limit_right, :limit_left, :sefaz_certificate,
                                   :sefaz_certificate_date, :sefaz_certificate_validate_date, :enterprise_typology_id)
    end

    def set_unit
      @unit = Address::Unit.find(params[:id])
    end
  end
end
