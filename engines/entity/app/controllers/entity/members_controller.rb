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

    def update 
      @member.update(set_params)
    end

    def destroy
      @member.destroy
    end

    private

    def set_params
      params.require(:member)
            .permit(:name, :cpf, :rg, :telephone, :telephone_optional, :cell_phone, :email)
    end 

    def set_entity
      @entity = Entity::Cadastre.find(params[:cadastre_id])
    end

    def set_member 
      @member = @entity.members.find(params[:id])
    end

  end
end