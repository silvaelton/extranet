require_dependency 'candidate/application_controller'

module Candidate
  class SearchCadastresController < ApplicationController
    
    def index
      cpf = params[:cpf].to_s.unformat_cpf
      
      @cadastre = Candidate::Cadastre.find_by(cpf: cpf)
    end

  end
end