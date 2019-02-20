require_dependency 'entity/application_controller'

module Entity
  class CadastresController < ApplicationController 
    
    def index
      @pagy, @entities = pagy(Entity::Cadastre.all)
    end 

    def new
    end 

    def show
    end

    def edit
    end 

    def update
    end 

    def destroy
    end

    private

    def set_entity
    end 

    def set_entities
    end
  end
end