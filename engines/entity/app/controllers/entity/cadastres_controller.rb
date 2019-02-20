require_dependency 'entity/application_controller'

module Entity
  class CadastresController < ApplicationController 
    before_action :set_cadastre, only: [:edit, :update, :show]

    has_scope :by_cnpj
    has_scope :by_acron
    has_scope :by_situation

    def index
      @pagy, @entities = pagy(apply_scopes(Entity::Cadastre).all)
    end 

    def new
    end 

    def show;end

    def edit;end 

    def update
    end 

    def destroy
    end

    private

    def set_cadastre
      @entity = Entity::Cadastre.find(params[:id])
    end 

    def set_entities
    end
  end
end