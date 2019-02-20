require_dependency 'juridical/application_controller'

module Juridical
  class InstancyPlacesController < ApplicationController
    before_action :set_instancy
    before_action :set_instancy_places, only: [:index, :create, :destroy, :update]
    before_action :set_instancy_place, only: [:edit, :destroy, :update]

    def index; end

    def new
      @instancy_place = @instancy.instancy_places.new
    end

    def create
      @instancy_place = @instancy.instancy_places.new(instancy_place_params)
      @instancy_place.save
    end

    def edit; end

    def update
      @instancy_place.update(instancy_place_params)
    end

    def destroy
      @instancy_place.destroy
    end

    private

    def instancy_place_params
      params.require(:instancy_place).permit(:name, :description, :status, :instancy_id)
    end

    def set_instancy_places
      @instancy_places = @instancy.instancy_places.all
    end

    def set_instancy_place
      @instancy_place = Juridical::InstancyPlace.find(params[:id])
    end

    def set_instancy
      @instancy = Juridical::Instancy.find(params[:instancy_id])
    end
  end
end
