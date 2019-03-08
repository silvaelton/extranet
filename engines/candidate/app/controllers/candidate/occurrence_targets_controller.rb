require_dependency "candidate/application_controller"

module Candidate
  class OccurrenceTargetsController < ApplicationController
    before_action :set_occurrence_targets
    before_action :set_occurrence_target, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_status
    
    def index;end

    def show; end

    def new
      @occurrence_target = Candidate::OccurrenceTarget.new
    end

    def create
      @occurrence_target = Candidate::OccurrenceTarget.new(set_params)
      @occurrence_target.user_id = current_user.id
      @occurrence_target.save
    end

    def edit; end

    def update
      @occurrence_target.update(set_params)
    end

    def destroy
      @occurrence_target.destroy
    end

    private

    def set_params
      params.require(:occurrence_target).permit(:name, :description, :observation, :status, :user_id)
    end

    def set_occurrence_targets
      @pagy, @occurrence_targets = pagy(apply_scopes(Candidate::OccurrenceTarget).all)
    end

    def set_occurrence_target
      @occurrence_target = Candidate::OccurrenceTarget.find(params[:id])
    end

  end
end