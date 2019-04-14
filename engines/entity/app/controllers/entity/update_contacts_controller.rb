require_dependency 'entity/application_controller'

module Entity
  class UpdateContactsController < ApplicationController
    before_action :set_cadastre

    def edit
    end

    def update
      @update_contact.update(set_params)
      @entity = Entity::Cadastre.find_by(id: params[:id])
    end

    private

    def set_params
      params.require(:update_contact).permit(:cep, :city_id, :state_id, :address, :address_complement, 
                                             :telephone, :email, :telephone_optional, :cell_phone)
    end
    
    def set_cadastre
      @update_contact = Entity::UpdateContact.find(params[:id])
    end
  end
end