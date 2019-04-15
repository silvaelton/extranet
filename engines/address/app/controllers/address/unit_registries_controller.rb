require_dependency 'address/application_controller'

module Address
  class UnitRegistriesController < ApplicationController
    before_action :set_unit
    before_action :set_unit_registries
    before_action :set_unit_registry, only: %i[edit update destroy]

    def index; end

    def new
      @unit_registry = @unit.unit_registries.new
    end

    def create
      @unit_registry = @unit.unit_registries.new(set_params)
      @unit_registry.save
    end

    def edit; end

    def update
      @unit_registry.update(set_params)
    end

    def destroy
      @unit_registry.destroy
    end

    private

    def set_params
      params.require(:unit_registry).permit(:unit_id, :registry_type_id)
    end

    def set_unit_registries
      @unit_registries = Address::UnitRegistry.all
    end

    def set_unit
      @unit = Address::Unit.find(params[:unit_id])
    end

    def set_unit_registry
      @unit_registry = @unit.unit_registries.find(params[:id])
    end
  end
end
