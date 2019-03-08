require_dependency "candidate/application_controller"

module Candidate
  class CadinsController < ApplicationController
    before_action :set_cadins
    before_action :set_cadin, only: [:edit, :show, :update, :destroy]

    has_scope :by_name
    has_scope :by_cpf
    
    def index;end

    def show; end

    def new
      @cadin = Candidate::Cadin.new
    end

    def create
      @cadin = Candidate::Cadin.new(set_params)
      @cadin.save
    end

    def edit; end

    def update
      @cadin.update(set_params)
    end

    def destroy
      @cadin.destroy
    end

    private

    def set_params
      params.require(:cadin).permit(:name, :cpf, :rg, :rg_org, :rg_uf_id, :born, :document_number, 
                                    :place_birth, :city_id, :address, :cep, :distribution_date, 
                                    :percentege, :observation, :estate)
    end

    def set_cadins
      @pagy, @cadins = pagy(apply_scopes(Candidate::Cadin).all)
    end

    def set_cadin
      @cadin = Candidate::Cadin.find(params[:id])
    end

  end
end