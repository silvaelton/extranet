require_dependency 'address/application_controller'

module Address
  class UnitsController < ApplicationController
    before_action :set_units, only: %i[index]
    before_action :set_unit,  only: %i[show]

    def index; end

    def show; end

    private

    def set_units
      @pagy, @units = pagy(apply_scopes(Address::Unit.all))
    end

    def set_unit
      @unit = Address::Unit.find(params[:id])
    end
  end
end
