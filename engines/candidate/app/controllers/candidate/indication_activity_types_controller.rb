require_dependency "candidate/application_controller"

module Candidate
  class IndicationActivityTypesController < ApplicationController
    before_action :set_indication_activity_types
    before_action :set_indication_activity_type, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_status
    
    def index;end

    def show; end

    def new
      @indication_activity_type = Candidate::IndicationActivityType.new
    end

    def create
      @indication_activity_type = Candidate::IndicationActivityType.new(set_params)
      @indication_activity_type.save
    end

    def edit; end

    def update
      @indication_activity_type.update(set_params)
    end

    def destroy
      @indication_activity_type.destroy
    end

    private

    def set_params
      params.require(:indication_activity_type).permit(:name, :status, :waiver)
    end

    def set_indication_activity_types
      @pagy, @indication_activity_types = pagy(apply_scopes(Candidate::IndicationActivityType).all)
    end

    def set_indication_activity_type
      @indication_activity_type = Candidate::IndicationActivityType.find(params[:id])
    end

  end
end