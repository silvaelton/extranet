require_dependency 'address/application_controller'

module Address
  class EnterpriseTypologiesController < ApplicationController
    before_action :set_enterprise
    before_action :set_enterprise_typology, only: %i[edit update destroy show]

    def new
      @enterprise_typology = @enterprise.enterprise_typologies.new
    end

    def create
      @enterprise_typology = @enterprise.enterprise_typologies.new(set_params)
      @enterprise_typology.save
    end

    def edit; end

    def update
      @enterprise_typology.update(set_params)
    end

    def destroy
      @enterprise_typology.destroy
    end

    def show; end

    private

    def set_params
      params.require(:enterprise_typology).permit(:name, :unit_quantity, :description, :home_type,
                                                  :private_area, :value_start, :status, :value_end,
                                                  :value_general)
    end

    def set_enterprise
      @enterprise = Address::Enterprise.find(params[:enterprise_id])
    end

    def set_enterprise_typology
      @enterprise_typology = @enterprise.enterprise_typologies.find(params[:id])
    end
  end
end
