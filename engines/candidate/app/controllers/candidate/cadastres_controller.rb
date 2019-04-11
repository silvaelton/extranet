require_dependency 'candidate/application_controller'

module Candidate
  class CadastresController < ApplicationController
    
    has_scope :by_cpf
    has_scope :by_name

    def index
      if params[:by_cpf].present? || params[:by_name].present?
        @cadastres = apply_scopes(Candidate::Cadastre).all
      end
    end

    def show
      @cadastre = Candidate::Cadastre.find(params[:id])
    end
    
  end
end