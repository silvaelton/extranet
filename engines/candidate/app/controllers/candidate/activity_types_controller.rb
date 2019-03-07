require_dependency "candidate/application_controller"

module Candidate
  class ActivityTypesController < ApplicationController
    before_action :set_activity_types
    before_action :set_activity_type, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @activity_type.new
    end

    def create
      @activity_type.new(set_params)
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
      params.require(:activity_type).permit(:name)
    end

    def set_activity_types
      @pagy, @activity_types = pagy(apply_scopes(Candidate::ActivityType).all)
    end

    def set_activity_type
      @activity_type = Candidate::ActivityType.find(params[:id])
    end

  end
end