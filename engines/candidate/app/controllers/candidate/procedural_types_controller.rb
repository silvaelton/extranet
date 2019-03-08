require_dependency "candidate/application_controller"

module Candidate
  class ProceduralTypesController < ApplicationController
    before_action :set_procedural_types
    before_action :set_procedural_type, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_status

    def index;end

    def show; end

    def new
      @procedural_type = Candidate::ProceduralType.new
    end

    def create
      @procedural_type = Candidate::ProceduralType.new(set_params)
      @procedural_type.save
    end

    def edit; end

    def update
      @procedural_type.update(set_params)
    end

    def destroy
      @procedural_type.destroy
    end

    private

    def set_params
      params.require(:procedural_type).permit(:name, :description, :status)
    end

    def set_procedural_types
      @pagy, @procedural_types = pagy(apply_scopes(Candidate::ProceduralType).all)
    end

    def set_procedural_type
      @procedural_type = Candidate::ProceduralType.find(params[:id])
    end

  end
end