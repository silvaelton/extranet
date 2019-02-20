require_dependency 'entity/application_controller'

module Entity
  class CadastreSituationsController < ApplicationController
    before_action :set_situations
    before_action :set_situation, only: [:edit, :update, :destroy]

    def index; end
    
    def new
      @situation = Entity::CadastreSituation.new
    end
    
    def create
      @situation = Entity::CadastreSituation.new(set_params)
      @situation.save
    end
    
    def edit; end

    def update
      @situation.update(set_params)
    end

    def destroy
      @situation.destroy
    end

    private
    
    def set_situations
      @situations = Entity::CadastreSituation.all.order(:id)
    end

    def set_params
      params.require(:cadastre_situation).permit(:name, :description, :status)
    end

    def set_situation
      @situation = Entity::CadastreSituation.find(params[:id])
    end
  end
end