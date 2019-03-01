require_dependency 'address/application_controller'

module Address
  class UnitUseTypesController < ApplicationController
    before_action :set_unit_use_types
    before_action :set_unit_use_type, only: %i[edit update destroy]

    def index; end

    def new
      @unit_use_type = Address::UnitUseType.new
    end

    def create
      @unit_use_type = Address::UnitUseType.new(set_params)
      @unit_use_type.save
    end

    def edit; end

    def update
      @unit_use_type.update(set_params)
    end

    def destroy
      @unit_use_type.destroy
    end

    private

    def set_params
      params.require(:unit_use_type).permit(:name, :status)
    end

    def set_unit_use_types
      @unit_use_types = Address::UnitUseType.all
    end

    def set_unit_use_type
      @unit_use_type = Address::UnitUseType.find(params[:id])
    end
  end
end
