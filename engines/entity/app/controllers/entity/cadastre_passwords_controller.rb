module Entity
  class CadastrePasswordsController < ApplicationController
    before_action :set_entity

    def edit
      @entity_password = Entity::CadastrePassword.new
      @entity_password.cadastre_id = params[:cadastre_id]
    end
    
    def update
      @entity_password = Entity::CadastrePassword.new(set_params)
      @entity_password.cadastre_id = params[:cadastre_id]
      @entity_password.save
    end

    private

    def set_params
      params.require(:cadastre_password).permit(:password, :password_confirmation)
    end

    def set_entity
      @entity = Entity::Cadastre.find(params[:cadastre_id])
    end


  end
end