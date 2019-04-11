require_dependency 'candidate/application_controller'

module Candidate
  class CadastreAuditsController < ApplicationController
    before_action :set_cadastre
    before_action :set_audits,  only: [:show]
    
    def index
    end
    
    def show
    end

    private

    def set_audits
      @audit = @cadastre.audits.find(params[:id])
    end

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
    end

  end
end