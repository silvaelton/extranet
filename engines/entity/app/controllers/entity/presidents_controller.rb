require_dependency 'entity/application_controller'

module Entity
  class PresidentsController < ApplicationController
    before_action :set_entity
    before_action :set_president, only: [:edit, :update, :destroy, :show]

    def new
      @president = @entity.presidents.new
    end 
    
    def create
      @president = @entity.presidents.new(set_params)
      @president.save
    end 

    def edit; end

    def update 
      @president.update(set_params)
    end

    def destroy
      @president.destroy
    end

    private

    def set_params
      params.require(:president)
            .permit(:name, :cpf, :rg, :telephone, :telephone_optional, :cell_phone, :email)
    end 

    def set_entity
      @entity = Entity::Cadastre.find(params[:cadastre_id])
    end

    def set_president 
      @president = @entity.presidents.find(params[:id])
    end

  end
end