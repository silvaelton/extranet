require_dependency 'address/application_controller'

module Address
  class UnitCadastreSituationsController < ApplicationController
    before_action :set_unit_cadastre_situations
    before_action :set_unit_cadastre_situation, only: %i[edit update destroy]

    def index; end

    def new
      @unit_cadastre_situation = Address::UnitCadastreSituation.new
    end

    def create
      @unit_cadastre_situation = Address::UnitCadastreSituation.new(set_params)
      @unit_cadastre_situation.save
    end

    def edit; end

    def update
      @unit_cadastre_situation.update(set_params)
    end

    def destroy
      @unit_cadastre_situation.destroy
    end

    private

    def set_params
      params.require(:unit_cadastre_situation).permit(:name, :status)
    end

    def set_unit_cadastre_situations
      @unit_cadastre_situations = Address::UnitCadastreSituation.all
    end

    def set_unit_cadastre_situation
      @unit_cadastre_situation = Address::UnitCadastreSituation.find(params[:id])
    end
  end
end
