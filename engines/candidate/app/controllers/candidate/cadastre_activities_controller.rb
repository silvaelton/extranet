require_dependency 'candidate/application_controller'

module Candidate
  class CadastreActivitiesController < ApplicationController 
    before_action :set_cadastre
    before_action :set_cadastre_activity, only: [:edit, :update, :destroy, :show]

    def new
      @cadastre_activity = @cadastre.cadastre_activities.new
    end
    
    def create
      @cadastre_activity = @cadastre.cadastre_activities.new(set_params)
      @cadastre_activity.user_id = current_user.id
      @cadastre_activity.save
    end
    
    def edit; end
    def show; end

    def update
      @cadastre_activity.update(set_params)
    end

    def destroy
      @cadastre_activity.destroy
    end

    private

    def set_params
      params.require(:cadastre_activity).permit(:cadastre_id, :cadastre_mirror_id, :activity_type_id, 
                                                :user_id, :date, :computer, :title, :justify, 
                                                :document, :critical, activity_documents_attributes: [:document, :id, :_destroy])
    end

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
    end

    def set_cadastre_activity
      @cadastre_activity = @cadastre.cadastre_activities.find(params[:id])
    end
  end
end