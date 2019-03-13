require_dependency 'address/application_controller'

module Address
  class BookingsController < ApplicationController
    before_action :set_unit

    def new
      @booking = Address::Booking.new
    end

    def create
      @booking = Address::Booking.new(set_params)
      @booking.valid?
    end

    private

    def set_params
      params.require(:booking).permit(:cpf, :observation)
    end

    def set_unit
      @unit = Address::Unit.find(params[:unit_id])
    end
  end
end
