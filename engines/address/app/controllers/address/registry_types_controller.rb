require_dependency 'address/application_controller'

module Address
  class RegistryTypesController < ApplicationController
    before_action :set_registry_types
    before_action :set_registry_type, only: %i[edit update destroy]

    def index; end

    def new
      @registry_type = Address::RegistryType.new
    end

    def create
      @registry_type = Address::RegistryType.new(set_params)
      @registry_type.save
    end

    def edit; end

    def update
      @registry_type.update(set_params)
    end

    def destroy
      @registry_type.destroy
    end

    private

    def set_params
      params.require(:registry_type).permit(:name, :status)
    end

    def set_registry_types
      @registry_types = Address::RegistryType.all
    end

    def set_registry_type
      @registry_type = Address::RegistryType.find(params[:id])
    end
  end
end
