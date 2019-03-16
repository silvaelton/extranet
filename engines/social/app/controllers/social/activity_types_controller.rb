require_dependency 'social/application_controller'

module Social
  class ActivityTypesController < ApplicationController
    before_action :set_activity_types
    before_action :set_activity_type, only: %i[edit update destroy show]

    def index; end

    def new
      @activity_type = Social::ActivityType.new
    end

    def create
      @activity_type = Social::ActivityType.new(set_params)
      @activity_type.save
    end

    def edit; end

    def update
      @activity_type.update(set_params)
    end

    def destroy
      @activity_type.destroy
    end

    def show; end

    private

    def set_params
      params.require(:activity_type).permit(:name, :status)
    end

    def set_activity_types
       @activity_types = Social::ActivityType.all
    end

    def set_activity_type
      @activity_type = Social::ActivityType.find(params[:id])
    end
  end
end
