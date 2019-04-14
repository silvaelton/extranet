require_dependency 'entity/application_controller'

module Entity
  class CadastreAuditsController < ApplicationController
    before_action :set_entity
    before_action :set_audit
    
    def index
    end
    
    def show
    end

    private

    def set_audit
      @audit = @entity.audits.find(params[:id])
    end

    def set_entity
      @entity = Entity::Cadastre.find(params[:cadastre_id])
    end

  end
end