require_dependency 'sefaz/application_controller'

module Sefaz
  class AllotmentsController < ApplicationController # :nodoc:
    before_action :set_allotments
    before_action :set_allotment, only: %i[edit update destroy]

    def index; end

    def new
      @allotment = Sefaz::Allotment.new
    end

    def create
      @allotment = Sefaz::Allotment.new(set_params)
      @allotment.request_situation_id = 1
      @allotment.save
    end

    def edit; end

    def update
      @allotment.update(set_params)
    end

    def destroy
      @allotment.destroy
    end

    private

    def set_params
      params.require(:allotment).permit(:exemption_type_id, :notifier_id,
                                        :observation, :request_situation_id,
                                        :request_type_id)
    end

    def set_allotments
      @allotments = Sefaz::Allotment.all
    end

    def set_allotment
      @allotment = Sefaz::Allotment.find(params[:id])
    end
  end
end
