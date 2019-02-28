require_dependency 'address/application_controller'

module Address
  class UnitSituationTypesController < ApplicationController
    before_action :set_unit_situation_types
    before_action :set_unit_situation_type, only: %i[edit update destroy]

    def index; end

    def new
      @unit_situation_type = Address::UnitSituationType.new
    end

    def create
      @unit_situation_type = Address::UnitSituationType.new(set_params)
      @unit_situation_type.save
    end

    def edit; end

    def update
      @unit_situation_type.update(set_params)
    end

    def destroy
      @unit_situation_type.destroy
    end

    private

    def set_params
      params.require(:unit_situation_type).permit(:name, :description, :status)
    end

    def set_unit_situation_types
      @unit_situation_types = Address::UnitSituationType.all
    end

    def set_unit_situation_type
      @unit_situation_type = Address::UnitSituationType.find(params[:id])
    end
  end
end
