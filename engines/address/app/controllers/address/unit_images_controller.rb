require_dependency 'address/application_controller'

module Address
  class UnitImagesController < ApplicationController
    before_action :set_unit
    before_action :set_unit_images
    before_action :set_unit_image, only: %i[edit update destroy]

    def index; end

    def create
      @unit_image = @unit.unit_images.new(set_params)
      @unit_image.user_id = current_user.id
      @unit_image.save
    end

    def edit; end

    def update
      @unit_image.update(set_params)
    end

    def destroy
      @unit_image.destroy
    end

    private

    def set_params
      params.require(:unit_image).permit(:image, :unit_id, :user_id, :description)
    end

    def set_unit
      @unit = Address::Unit.find(params[:unit_id])
    end

    def set_unit_images
      @unit_images = Address::UnitImage.all
    end

    def set_unit_image
      @unit_image = @unit.unit_images.find(params[:id])
    end
  end
end
