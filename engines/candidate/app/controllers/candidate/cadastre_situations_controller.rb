require_dependency 'candidate/application_controller'

module Candidate
  class CadastreSituationsController < ApplicationController 
    before_action :set_cadastre
    before_action :set_situation_cadastre, only: [:edit, :update, :destroy]
    
    def new
    end 
    
    def create
    end 
    
    def edit
    end 

    def update
    end

    def destroy
    end

    private

    def set_params
    end

    def set_cadastre
    end

    def set_situation_cadastre
    end
  end
end