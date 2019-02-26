require_dependency 'person/application_controller'

module Person
  class SectorsController < ApplicationController
    before_action :set_sectors
    before_action :set_sector, only: %i[edit update destroy]

    def index; end

    def new
      @sector = Person::Sector.new
    end

    def create
      @sector = Person::Sector.new(set_params)
      @sector.save
    end

    def edit; end

    def update
      @sector.update(set_params)
    end

    def destroy
      @sector.destroy
    end

    private

    def set_params
      params.require(:sector).permit(:name, :acron, :prefex, :father_id,
                                     :responsible_id, :status, :code, :color)
    end

    def set_sectors
      @pagy, @sectors = pagy(apply_scopes(Person::Sector).all.order(:name))
    end
    
    def set_sector
      @sector = Person::Sector.find(params[:id])
    end

  end
end