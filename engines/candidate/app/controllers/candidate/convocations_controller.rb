require_dependency "candidate/application_controller"

module Candidate
  class ConvocationsController < ApplicationController
    before_action :set_convocations
    before_action :set_convocation, only: [:edit, :show, :update, :destroy]

    has_scope :by_name
    has_scope :by_status

    def index;end

    def show; end

    def new
      @convocation = Candidate::Convocation.new
    end

    def create
      @convocation = Candidate::Convocation.new(set_params)
      @convocation.user_id = current_user.id
      @convocation.save
    end

    def edit; end

    def update
      @convocation.update(set_params)
    end

    def destroy
      @convocation.destroy
    end

    private

    def set_params
      params.require(:convocation).permit(:name, :description, :start_date, :end_date, :quantity, 
                                          :justify, :status, :program_id, :sub_program_id, :user_id, 
                                          :document, :document_date)
    end

    def set_convocations
      @pagy, @convocations = pagy(apply_scopes(Candidate::Convocation).all)
    end

    def set_convocation
      @convocation = Candidate::Convocation.find(params[:id])
    end

  end
end