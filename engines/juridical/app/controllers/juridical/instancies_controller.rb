require_dependency 'juridical/application_controller'

module Juridical
  class InstanciesController < ApplicationController
    before_action :set_instancies, only: [:index, :create, :destroy, :update]
    before_action :set_instancy, only: [:edit, :destroy, :update]

    def index; end

    def new
      @instancy = Juridical::Instancy.new
    end

    def instancy_places
      params[:instancy_id] = nil unless params[:instancy_id].present?
      @instancy_places = Juridical::InstancyPlace.select(:name, :id).where(instancy_id: params[:instancy_id]).order(:name).distinct
      render json: @instancy_places
    end

    def create
      @instancy = Juridical::Instancy.new(instancy_params)
      @instancy.save
    end

    def edit; end

    def update
      @instancy.update(instancy_params)
    end

    def destroy
      @instancy.destroy
    end

    private

    def instancy_params
      params.require(:instancy).permit(:name, :description, :status)
    end

    def set_instancies
      @instancies = Juridical::Instancy.all
    end

    def set_instancy
      @instancy = Juridical::Instancy.find(params[:id])
    end
  end
end
