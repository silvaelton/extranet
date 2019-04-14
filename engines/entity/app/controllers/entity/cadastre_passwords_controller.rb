module Entity
  class CadastrePasswordsController < ApplicationController
    before_action :set_entity

    def edit
      @cadastre_password = Candidate::CadastrePassword.new
      @cadastre_password.cadastre_id = params[:cadastre_id]
    end
    
    def update
      @cadastre_password = Candidate::CadastrePassword.new(set_params)
      @cadastre_password.cadastre_id = params[:cadastre_id]
      @cadastre_password.save
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