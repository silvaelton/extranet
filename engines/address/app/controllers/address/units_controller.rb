require_dependency 'address/application_controller'

module Address
  class UnitsController < ApplicationController
    before_action :set_units, only: %i[index]
    before_action :set_unit,  only: %i[edit update show]

    has_scope :by_city
    has_scope :by_burgh
    has_scope :by_group
    has_scope :by_block
    has_scope :by_unit
    has_scope :by_situation
    has_scope :by_registry

    def index; end

    def edit; end

    def update
      @unit.update(set_params)
    end

    def show; end

    private

    def set_params
      params.require(:unit).permit(:block, :acron_block, :group, :acron_group, :acron_unit,
                                   :unit, :complete_address, :cep, :burgh, :area, :donate, :iptu_date,
                                   :iptu_number)
    end

    def set_units
      @units_all = apply_scopes(Address::Unit.all)
      @pagy, @units = pagy(@units_all)
    end

    def set_unit
      @unit = Address::Unit.find(params[:id])
    end
  end
end
