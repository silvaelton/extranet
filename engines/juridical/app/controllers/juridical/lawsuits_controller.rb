require_dependency 'juridical/application_controller'

module Juridical
  class LawsuitsController < ApplicationController
    before_action :set_lawsuits, only: [:index, :create, :destroy, :update]
    before_action :set_lawsuit, only: [:edit, :destroy, :update]

    def index; end

    def new
      @lawsuit = Juridical::Lawsuit.new
    end

    def create
      @lawsuit = Juridical::Lawsuit.new(lawsuit_params)
      @lawsuit.save
    end

    def edit; end

    def update
      @lawsuit.update(lawsuit_params)
    end

    def destroy
      @lawsuit.destroy
    end

    private

    def lawsuit_params
      params.require(:lawsuit).permit(:name, :description, :status)
    end

    def set_lawsuits
      @lawsuits = Juridical::Lawsuit.all
    end

    def set_lawsuit
      @lawsuit = Juridical::Lawsuit.find(params[:id])
    end
  end
end
