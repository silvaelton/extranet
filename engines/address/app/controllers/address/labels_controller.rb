require_dependency 'address/application_controller'

module Address
  class LabelsController < ApplicationController
    before_action :set_labels
    before_action :set_label, only: %i[edit update destroy]

    def index; end

    def new
      @label = Address::Label.new
    end

    def create
      @label = Address::Label.new(set_params)
      @label.save
    end

    def edit; end

    def update
      @label.update(set_params)
    end

    def destroy
      @label.destroy
    end

    private

    def set_params
      params.require(:label).permit(:name, :status)
    end

    def set_labels
      @labels = Address::Label.all
    end

    def set_label
      @label = Address::Label.find(params[:id])
    end
  end
end
