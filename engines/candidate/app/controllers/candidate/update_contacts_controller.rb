require_dependency 'candidate/application_controller'

module Candidate
  class UpdateContactsController < ApplicationController
    before_action :set_cadastre

    def edit
    end

    def update
      @update_contact.update(set_params)
      @cadastre = Candidate::Cadastre.find_by(id: params[:id])
    end

    private

    def set_params
      params.require(:update_contact).permit(:cep, :city_id, :state_id, :address, :address_complement, 
                                             :telephone, :email, :telephone_optional, :celphone)
    end
    
    def set_cadastre
      @update_contact = Candidate::UpdateContact.find(params[:id])
    end
  end
end