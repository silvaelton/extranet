require_dependency 'social/application_controller'

module Social
  class CitiesController < ApplicationController
    before_action :set_cities
    before_action :set_city, only: %i[edit update destroy]

    def index; end

    def new
      @city = Social::City.new
    end

    def create
      @city = Social::City.new(set_params)
      @city.save
    end

    def edit; end

    def update
      @city.update(set_params)
    end

    def destroy
      @city.destroy
    end

    def show; end

    private

    def set_params
      params.require(:city).permit(:name, :status)
    end

    def set_cities
       @cities = Social::City.all
    end

    def set_city
      @city = Social::City.find(params[:id])
    end
  end
end
