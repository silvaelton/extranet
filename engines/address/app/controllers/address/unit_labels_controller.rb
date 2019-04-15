require_dependency 'address/application_controller'

module Address
  class UnitLabelsController < ApplicationController
    before_action :set_unit
    before_action :set_unit_labels
    before_action :set_unit_label, only: %i[edit update destroy]

    def index; end

    def new
      @unit_label = @unit.unit_labels.new
    end

    def create
      @unit_label = @unit.unit_labels.new(set_params)
      @unit_label.user_id = current_user.id
      @unit_label.save
    end

    def edit; end

    def update
      @unit_label.update(set_params)
    end

    def destroy
      @unit_label.destroy
    end

    private

    def set_params
      params.require(:unit_label).permit(:user_id, :unit_id, :observation, :label_id)
    end

    def set_unit_labels
      @unit_labels = Address::UnitActivity.all
    end

    def set_unit
      @unit = Address::Unit.find(params[:unit_id])
    end

    def set_unit_label
      @unit_label = @unit.unit_labels.find(params[:id])
    end
  end
end
