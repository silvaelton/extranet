require_dependency 'address/application_controller'

module Address
  class UnitsController < ApplicationController
    before_action :set_units, only: %i[index]
    before_action :set_unit,  only: %i[show]

    has_scope :by_city
    has_scope :by_burgh
    has_scope :by_group
    has_scope :by_block
    has_scope :by_unit
    has_scope :by_situation
    has_scope :by_registry

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
