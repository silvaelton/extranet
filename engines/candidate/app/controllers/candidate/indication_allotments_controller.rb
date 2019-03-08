require_dependency "candidate/application_controller"

module Candidate
  class IndicationAllotmentsController < ApplicationController
    before_action :set_indication_allotments
    before_action :set_indication_allotment, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_status

    def index;end

    def show; end

    def new
      @indication_allotment = Candidate::IndicationAllotment.new
    end

    def create
      @indication_allotment = Candidate::IndicationAllotment.new(set_params)
      @indication_allotment.save
    end

    def edit; end

    def update
      @indication_allotment.update(set_params)
    end

    def destroy
      @indication_allotment.destroy
    end

    private

    def set_params
      params.require(:indication_allotment).permit(:name, :description, :enterprise_id, :ticket_id, :user_id, 
                                                   :income_start, :income_end, :program_id, :evaluation_entity, 
                                                   :evaluation_entity_id, :filter_city, :filter_city_id, 
                                                   :ignore_active_indicated, :ignore_occurrence, :demand, :rii, 
                                                   :rie, :old, :special, :vulnerable, :status, :process, :process_at, 
                                                   :process_user_id, :only_extract)
    end

    def set_indication_allotments
      @pagy, @indication_allotments = pagy(apply_scopes(Candidate::IndicationAllotment).all)
    end

    def set_indication_allotment
      @indication_allotment = Candidate::IndicationAllotment.find(params[:id])
    end

  end
end