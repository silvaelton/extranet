require_dependency 'entity/application_controller'

module Entity
  class EnterprisesController < ApplicationController 
    before_action :set__enterprise, only: %i[edit update]
    
    def index
    end
    
    def edit; end

    def update
      @enterprise.update(set_params)
      @enterprise.entity_id = params[:entity_id]
    end

    private

    def set_params
      params.require(:_enterprise).permit(:entity_id)
    end

    def set__enterprise
      @enterprise = Entity::Enterprise.find(params[:id])
    end
  end
end
