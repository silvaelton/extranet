require_dependency 'social/application_controller'

module Social
  class CadastresController < ApplicationController
    before_action :set_cadastres
    before_action :set_cadastre, only: %i[edit update destroy show]

    def index; end

    def new
      @cadastre = Social::Cadastre.new
    end

    def create
      @cadastre = Social::Cadastre.new(set_params)
      @cadastre.save
    end

    def edit; end

    def update
      @cadastre.update(set_params)
    end

    def destroy
      @cadastre.destroy
    end

    def show; end

    private

    def set_params
      params.require(:cadastre).permit(:name, :cpf, :gender_id, :born, :rg, :rg_org,
                                       :rg_uf_id, :rg_date, :place_birth, :telephone,
                                       :cellphone, :email, :relative_special, :cep,
                                       :city_id, :burgh_id, :address, :income, :work,
                                       :work_ocupation, :nis, :mother_name, :father_name,
                                       :pension, :pension_id, :benfit, :benefit_id,
                                       :education_id, :course_interest, :course_name, :civil_state_id)
    end

    def set_cadastres
       @pagy, @cadastres = pagy(apply_scopes(Social::Cadastre.all))
    end

    def set_cadastre
      @cadastre = Social::Cadastre.find(params[:id])
    end
  end
end
