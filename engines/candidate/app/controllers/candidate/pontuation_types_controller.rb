require_dependency "candidate/application_controller"

module Candidate
  class PontuationTypesController < ApplicationController
    before_action :set_pontuation_types
    before_action :set_pontuation_type, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_program_id

    def index;end

    def show; end

    def new
      @pontuation_type = Candidate::PontuationType.new
    end

    def create
      @pontuation_type = Candidate::PontuationType.new(set_params)
      @pontuation_type.save
    end

    def edit; end

    def update
      @pontuation_type.update(set_params)
    end

    def destroy
      @pontuation_type.destroy
    end

    private

    def set_params
      params.require(:pontuation_type).permit(:name, :description, :status, :program_id)
    end

    def set_pontuation_types
      @pontuation_types_all = apply_scopes(Candidate::PontuationType).all.order(id: :asc)
      @pagy, @pontuation_types = pagy(@pontuation_types_all)
    end

    def set_pontuation_type
      @pontuation_type = Candidate::PontuationType.find(params[:id])
    end

  end
end