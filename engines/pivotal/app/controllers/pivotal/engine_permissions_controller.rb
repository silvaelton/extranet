require_dependency 'pivotal/application_controller'

module Pivotal
  class EnginePermissionsController < ApplicationController
    before_action :set_engine
    before_action :set_engine_permission, only: [:edit, :update, :destroy]
    
    def index; end
    
    def new
      @engine_permission = @engine.engine_permissions.new
    end
    
    def create
      @engine_permission = @engine.engine_permissions.new(set_params)
      @engine_permission.save
    end

    def edit;end
    
    def update
      @engine_permission.update(set_params)
    end

    def destroy
      @engine_permission.destroy
    end

    private

    def set_params
      params.require(:engine_permission).permit(:name, :code, :status, :description, 
                                                :url, :target_method, :system_engine_id)
    end

    def set_engine_permission
      @engine_permission = @engine.engine_permissions.find(params[:id])
    end
    
    def set_engine
      @engine = Pivotal::SystemEngine.find(params[:system_engine_id])
    end

  end
end