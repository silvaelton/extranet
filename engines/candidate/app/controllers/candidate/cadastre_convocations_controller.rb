require_dependency 'candidate/application_controller'

module Candidate
  class CadastreConvocationsController < ApplicationController 
    before_action :set_cadastre
    before_action :set_convocation_cadastre, only: [:edit, :update, :destroy]

    def new
      @cadastre_convocation = @cadastre.cadastre_convocations.new
    end
    
    def create
      @cadastre_convocation = @cadastre.cadastre_convocations.new(set_params)
      @cadastre_convocation.user_id = current_user.id
      @cadastre_convocation.save
    end
    
    def edit
    end

    def update
      @cadastre_convocation.update(set_params)
    end

    def destroy
      @cadastre_convocation.destroy
    end

    private

    def set_params
      params.require(:cadastre_convocation).permit(:cadastre_id, :convocation_id, :status, :user_id, :observation)
    end

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
    end

    def set_convocation_cadastre
      @cadastre_convocation = @cadastre.cadastre_convocations.find(params[:id])
    end
  end
end