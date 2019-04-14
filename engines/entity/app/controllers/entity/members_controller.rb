require_dependency 'entity/application_controller'

module Entity
  class MembersController < ApplicationController
    before_action :set_entity
    before_action :set_member, only: [:edit, :update, :destroy, :show]

    def new
      @member = @entity.members.new
    end 
    
    def create
      @member = @entity.members.new(set_params)
      @member.save
    end 

    def edit; end
    
    def show; end

    def update 
      @member.update(set_params)
    end

    def destroy
      @member.destroy
    end

    private

    def set_params
      params.require(:member)
            .permit(:cadastre_id, :name, :cpf, :rg, :rg_org, :rg_uf_id, :city_id, :address, 
                    :cep, :email, :born, :telephone, :telephone_optional, :cell_phone, 
                    :certificate_civil_criminal, :photo, :status, :job_id)
    end 

    def set_entity
      @entity = Entity::Cadastre.find(params[:cadastre_id])
    end

    def set_member 
      @member = @entity.members.find(params[:id])
    end

  end
end