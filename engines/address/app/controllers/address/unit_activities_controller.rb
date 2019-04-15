require_dependency 'address/application_controller'

module Address
  class UnitActivitiesController < ApplicationController
    before_action :set_unit
    before_action :set_unit_activities
    before_action :set_unit_activity, only: %i[edit update destroy]

    def index; end

    def new
      @unit_activity = @unit.unit_activities.new
    end

    def create
      @unit_activity = @unit.unit_activities.new(set_params)
      @unit_activity.user_id = current_user.id
      @unit_activity.save
    end

    def edit; end

    def update
      @unit_activity.update(set_params)
    end

    def destroy
      @unit_activity.destroy
    end

    private

    def set_params
      params.require(:unit_activity).permit(:user_id, :unit_id, :description, :actvity_type_id, :document)
    end

    def set_unit_activities
      @unit_activities = Address::UnitActivity.all
    end

    def set_unit
      @unit = Address::Unit.find(params[:unit_id])
    end

    def set_unit_activity
      @unit_activity = @unit.unit_activities.find(params[:id])
    end
  end
end
