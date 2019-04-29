require_dependency 'candidate/application_controller'

module Candidate
  class SearchCadastresController < ApplicationController
    
    def index
      cpf = params[:cpf].to_s.unformat_cpf
      
      @cadastres = Candidate::CadastreUnionView.where(cpf: cpf)
    end

  end
end