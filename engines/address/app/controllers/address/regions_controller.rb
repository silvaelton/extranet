require_dependency 'address/application_controller'

module Address
  class RegionsController < ApplicationController
    before_action :set_regions
    before_action :set_region, only: %i[edit update destroy]

    def index; end

    def new
      @region = Address::Region.new
    end

    def create
      @region = Address::Region.new(set_params)
      @region.save
    end

    def edit; end

    def update
      @region.update(set_params)
    end

    def destroy
      @region.destroy
    end

    private

    def set_params
      params.require(:region).permit(:name, :description, :status)
    end

    def set_regions
      @regions = Address::Region.all
    end

    def set_region
      @region = Address::Region.find(params[:id])
    end
  end
end
