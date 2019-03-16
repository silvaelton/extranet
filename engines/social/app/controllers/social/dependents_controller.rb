require_dependency 'social/application_controller'

module Social
  class DependentsController < ApplicationController
    before_action :set_cadastre
    before_action :set_dependent, only: %i[edit update destroy]

    def new
      @dependent = @cadastre.dependents.new
    end

    def create
      @dependent = @cadastre.dependents.new(set_params)
      @dependent.save
    end

    def edit; end

    def update
      @dependent.update(set_params)
    end

    def destroy
      @dependent.destroy
    end

    private

    def set_params
      params.require(:dependent).permit(:name, :cpf, :status, :gender_id, :born,
                                        :rg, :rg_org, :rg_uf_id, :rg_date, :kinship_id,
                                        :civil_state_id, :education_id, :course_interest,
                                        :course_name, :income, :work_ocupation)
    end

    def set_dependent
      @dependent = @cadastre.dependents.find(params[:id])
    end

    def set_cadastre
      @cadastre = Social::Cadastre.find(params[:cadastre_id])
    end
  end
end
