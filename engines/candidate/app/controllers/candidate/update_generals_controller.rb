require_dependency 'candidate/application_controller'

module Candidate
  class UpdateGeneralsController < ApplicationController
    before_action :set_cadastre

    def edit
    end

    def update
      @update_general.update(set_params)
      @cadastre = Candidate::Cadastre.find_by(id: params[:id])
    end

    private

    def set_params
      params.require(:update_general).permit(:name, :cpf, :gender_id, :born, :born_uf_id, :rg, 
                                                  :rg_org, :rg_uf_id, :place_birth, :arrival_df, :telephone, 
                                                  :telephone_optional, :celphone, :email, :special_condition, 
                                                  :special_condition_type_id, :adapted_property, :cep, :city_id, 
                                                  :state_id, :address, :address_complement, :family_income, 
                                                  :personal_income, :work_cep, :work_city_id, :work_state_id, 
                                                  :work_address, :work_employment, :nis, :cid, :mother_name, 
                                                  :civil_state_id, :program_id, :sub_program_id, :password, 
                                                  :password_token, :password_token_expires_at, :session_token, 
                                                  :introduce, :nationality, :wedding_regime, :wedding_date, 
                                                  :admission_date, :avatar, :app_push_token, :app_user_token, :scoring)
    end
    
    def set_cadastre
      @update_general = Candidate::UpdateGeneral.find(params[:id])
    end
  end
end