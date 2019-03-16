require_dependency 'social/application_controller'

module Social
  class BurghsController < ApplicationController
    before_action :set_city
    before_action :set_burghs
    before_action :set_burgh, only: %i[edit update destroy show]

    def index; end

    def new
      @burgh = @city.burghs.new
    end

    def create
      @burgh = @city.burghs.new(set_params)
      @burgh.save
    end

    def edit; end

    def update
      @burgh.update(set_params)
    end

    def destroy
      @burgh.destroy
    end

    def show; end

    private

    def set_params
      params.require(:burgh).permit(:name, :status, :city_id)
    end

    def set_burghs
      @burghs = @city.burghs.all
      respond_to do |format|
        format.json { render json: @burghs }
        format.html { @burghs }
      end
    end

    def set_burgh
      @burgh = @city.burghs.find(params[:id])
    end

    def set_city
      @city = Social::City.find(params[:city_id])
    end
  end
end
