require_dependency 'candidate/application_controller'

module Candidate
  class CadastresController < ApplicationController
    
    def index
      redirect_to candidate.root_path
    end

    def show
      @cadastre = Candidate::Cadastre.find(params[:id])
    end
    
  end
end