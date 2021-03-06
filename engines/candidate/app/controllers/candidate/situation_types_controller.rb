require_dependency "candidate/application_controller"

module Candidate
  class SituationTypesController < ApplicationController
    before_action :set_situation_types
    before_action :set_situation_type, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_program_id

    def index;end

    def show; end

    def new
      @situation_type = Candidate::SituationType.new
    end

    def create
      @situation_type = Candidate::SituationType.new(set_params)
      @situation_type.save
    end

    def edit; end

    def update
      @situation_type.update(set_params)
    end

    def destroy
      @situation_type.destroy
    end

    private

    def set_params
      params.require(:situation_type).permit(:name, :description, :status, :program_id)
    end

    def set_situation_types
      @situation_types_all = apply_scopes(Candidate::SituationType).all.order(id: :asc)
      @pagy, @situation_types = pagy(@situation_types_all)
    end

    def set_situation_type
      @situation_type = Candidate::SituationType.find(params[:id])
    end

  end
end