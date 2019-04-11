require_dependency 'candidate/application_controller'

module Candidate
  class CadastreSendEmailsController < ApplicationController
    before_action :set_cadastre
  
    def new
      @send_email = Candidate::CadastreSendEmail.new
    end
    
    def create
      @send_email = Candidate::CadastreSendEmail.new(set_params)
      @send_email.user_id = current_user.id
      @send_email.cadastre_id = params[:cadastre_id]
      @send_email.save
    end 

    private

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
    end

    def set_params
      params.require(:cadastre_send_email)
            .permit(:content, :title, :from)
    end
  end
end