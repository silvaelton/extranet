require_dependency 'candidate/application_controller'

module Candidate
  class CadastreSendMenssagesController < ApplicationController
    before_action :set_cadastre

    def new
      @send_menssage = Candidate::CadastreSendMenssage.new
    end
    
    def create
      @send_menssage = Candidate::CadastreSendMenssage.new(set_params)
      @send_menssage.user_id = current_user.id
      @send_menssage.cadastre_id = params[:cadastre_id]
      @send_menssage.save
    end 

    private

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
    end

    def set_params
      params.require(:cadastre_send_menssage)
            .permit(:content)
    end
  end
end