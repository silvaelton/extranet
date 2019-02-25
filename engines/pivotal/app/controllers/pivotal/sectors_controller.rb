require_dependency 'pivotal/application_controller'

module Pivotal
  class SectorsController < ApplicationController
    before_action :set_sectors
    before_action :set_sector, only: [:edit, :update, :destroy]
    
    def index; end
    
    def new
      @sector = Pivotal::Sector.new
    end
    
    def create
      @sector = Pivotal::Sector.new(set_params)
      @sector.save
    end

    def edit;end
    
    def update
      @sector.update(set_params)
    end

    def destroy
      @sector.destroy
    end

    private

    def set_params
      params.require(:sector).permit(:name, :acron, :prefex, :father_id, :responsible_id, :status, :code, :color)
    end

    def set_sector
      @sector = Pivotal::Sector.find(params[:id])
    end

    def set_sectors
      @pagy, @sectors = pagy(Pivotal::Sector.all.order(:name))
    end
  end
end