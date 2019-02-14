require_dependency 'juridical/application_controller'

module Juridical
  class AdviceTypesController < ApplicationController
    before_action :set_advice_types, only: [:index, :create, :destroy, :update]
    before_action :set_advice_type, only: [:edit, :destroy, :update]

    def index; end

    def new
      @advice_type = Juridical::AdviceType.new
    end

    def create
      @advice_type = Juridical::AdviceType.new(advice_type_params)
      @advice_type.save
    end

    def edit; end

    def update
      @advice_type.update(advice_type_params)
    end

    def destroy
      @advice_type.destroy
    end

    private

    def advice_type_params
      params.require(:advice_type).permit(:name, :description, :status)
    end

    def set_advice_types
      @advice_types = Juridical::AdviceType.all
    end

    def set_advice_type
      @advice_type = Juridical::AdviceType.find(params[:id])
    end
  end
end
