require_dependency 'candidate/application_controller'

module Candidate
  class DependentsController < ApplicationController
    before_action :set_cadastre
    before_action :set_dependent, only: [:edit, :update, :destroy, :show]

    def new
      @dependent = @cadastre.dependents.new
    end

    def create
      @dependent = @cadastre.dependents.new(set_params)
      @dependent.save
    end

    def edit
    end
    def show
    end

    def update
      @dependent.update(set_params)
    end

    def destroy
      @dependent.destroy
    end

    private

    def set_params
      params.require(:dependent).permit(:cadastre_id, :name, :cpf, :rg, :rg_org, :rg_uf_id,
                                        :born, :gender_id, :place_birth, :civil_state_id, :income,
                                        :kinship_id, :special_condition, :special_condition_type_id,
                                        :cid, :nis, :employment, :nationality, :admission_date,
                                        :deceased, :deceased_date, :deceased_observation)
    end

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
    end

    def set_dependent
      @dependent = @cadastre.dependents.find(params[:id])
    end
  end
end
