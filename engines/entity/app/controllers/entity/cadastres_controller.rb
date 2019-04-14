require_dependency 'entity/application_controller'

module Entity
  class CadastresController < ApplicationController 
    before_action :set_entities
    before_action :set_entity, only: [:edit, :update, :show, :destroy]

    has_scope :by_cnpj
    has_scope :by_acron
    has_scope :by_situation

    def index; end 

    def new
    end 

    def show;end

    def edit;end 

    def update
      @entity.update(set_params)
    end 

    def destroy
      @entity.destroy
    end

    private

    def set_params
      params.require(:cadastre).permit(:name, :cnpj, :acron, :telephone, :telephone_optional, :cell_phone, 
                                       :email, :address, :address_number, :address_complement, :cep, :observation, 
                                       :status, :password, :lat, :lng)
      
    end

    def set_entity
      @entity = Entity::Cadastre.find(params[:id])
    end 

    def set_entities
      @pagy, @entities = pagy(apply_scopes(Entity::Cadastre).all.order(:acron))
    end
  end
end