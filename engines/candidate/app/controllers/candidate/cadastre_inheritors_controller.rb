require_dependency 'candidate/application_controller'

module Candidate
  class CadastreInheritorsController < ApplicationController 
    before_action :set_cadastre
    before_action :set_cadastre_inheritor, only: [:edit, :update, :destroy]

    def new
      @cadastre_inheritor = @cadastre.cadastre_inheritors.new
    end
    
    def create
      @cadastre_inheritor = @cadastre.cadastre_inheritors.new(set_params)
      @cadastre_inheritor.save
    end
    
    def edit
    end

    def update
      @cadastre_inheritor.update(set_params)
    end

    def destroy
      @cadastre_inheritor.destroy
    end

    private

    def set_params
      params.require(:cadastre_inheritor).permit(:cadastre_id, :place_birth, :name, :cpf, :rg, 
                                                 :born, :civil_state_id, :gender_id, :single_name, 
                                                 :percentage, :observation, :estate)
    end

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
    end

    def set_cadastre_inheritor
      @cadastre_inheritor = @cadastre.cadastre_inheritors.find(params[:id])
    end
  end
end