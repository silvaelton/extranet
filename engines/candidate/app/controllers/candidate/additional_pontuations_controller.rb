require_dependency 'candidate/application_controller'

module Candidate
  class AdditionalPontuationsController < ApplicationController
    before_action :set_additional_pontuations
    before_action :set_additional_pontuation, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_program_id

    def index;end

    def show; end

    def new
      @additional_pontuation = Candidate::AdditionalPontuation.new
    end

    def create
      @additional_pontuation = Candidate::AdditionalPontuation.new(set_params)
      @additional_pontuation.save
    end

    def edit; end

    def update
      @additional_pontuation.update(set_params)
    end

    def destroy
      @additional_pontuation.destroy
    end

    private

    def set_params
      params.require(:additional_pontuation).permit(:name, :description, :status, :program_id)
    end

    def set_additional_pontuations
      @additional_pontuations_all = apply_scopes(Candidate::AdditionalPontuation).all.order(id: :asc)
      @pagy, @additional_pontuations = pagy(@additional_pontuations_all)
    end

    def set_additional_pontuation
      @additional_pontuation = Candidate::AdditionalPontuation.find(params[:id])
    end

  end
end