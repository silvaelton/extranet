require_dependency 'entity/application_controller'

module Entity
  class UpdateSituationsController < ApplicationController
    before_action :set_cadastre

    def edit
    end

    def update
      @update_situation.update(set_params)
      @entity = Entity::Cadastre.find_by(id: params[:id])
    end

    private

    def set_params
      params.require(:update_situation).permit(:situation_id)
    end
    
    def set_cadastre
      @update_situation = Entity::UpdateSituation.find(params[:id])
    end
  end
end