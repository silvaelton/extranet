require_dependency 'address/application_controller'

module Address
  class ActivityTypesController < ApplicationController
    before_action :set_activity_types
    before_action :set_activity_type, only: %i[edit update destroy]

    def index; end

    def new
      @activity_type = Address::ActivityType.new
    end

    def create
      @activity_type = Address::ActivityType.new(set_params)
      @activity_type.save
    end

    def edit; end

    def update
      @activity_type.update(set_params)
    end

    def destroy
      @activity_type.destroy
    end

    private

    def set_params
      params.require(:activity_type).permit(:name, :status)
    end

    def set_activity_types
      @activity_types = Address::ActivityType.all
    end

    def set_activity_type
      @activity_type = Address::ActivityType.find(params[:id])
    end
  end
end
