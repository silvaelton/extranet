require_dependency 'entity/application_controller'

module Entity
  class CadastreActivitiesController < ApplicationController
    before_action :set_entity
    before_action :set_cadastre_activity, only: [:edit, :update, :destroy, :show]

    def new
      @cadastre_activity = @entity.cadastre_activities.new
    end 
    
    def create
      @cadastre_activity = @entity.cadastre_activities.new(set_params)
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
      params.require(:cadastre_activity)
            .permit(:cadastre_id, :description, :user_id, :activity_type_id, :entity)
    end 

    def set_entity
      @entity = Entity::Cadastre.find(params[:cadastre_id])
    end

    def set_cadastre_activity 
      @cadastre_activity = @entity.cadastre_activities.find(params[:id])
    end

  end
end