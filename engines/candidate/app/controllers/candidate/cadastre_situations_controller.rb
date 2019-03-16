require_dependency 'candidate/application_controller'

module Candidate
  class CadastreSituationsController < ApplicationController 
    before_action :set_cadastre
    before_action :set_situation_cadastre, only: [:edit, :update, :destroy]

    def new
      @cadastre_situation = @cadastre.cadastre_situations.new
    end
    
    def create
      @cadastre_situation = @cadastre.cadastre_situations.new(set_params)
      @cadastre_situation.user_id = current_user.id
      @cadastre_situation.save
    end
    
    def edit
    end

    def update
      @cadastre_situation.update(set_params)
    end

    def destroy
      @cadastre_situation.destroy
    end

    private

    def set_params
      params.require(:cadastre_situation).permit(:cadastre_id, :cadastre_mirror_id, :situation_type_id, 
                                                 :subscribe_id, :user_id, :observation, :computer, 
                                                 :cadastre_convocation_id, :process_number, :process_sei)
    end

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
    end

    def set_situation_cadastre
      @cadastre_situation = @cadastre.cadastre_situations.find(params[:id])
    end
  end
end