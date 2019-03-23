require_dependency 'pivotal/application_controller'

module Pivotal
  class SystemEnginesController < ApplicationController
    before_action :set_engines
    before_action :set_engine, only: [:edit, :update, :destroy, :show]
    
    def index; end
    def show; end
    
    def new
      @engine = Pivotal::SystemEngine.new
    end
    
    def create
      @engine = Pivotal::SystemEngine.new(set_params)
      @engine.save
    end

    def edit;end
    
    def update
      @engine.update(set_params)
    end

    def destroy
      @engine.destroy
    end

    private

    def set_params
      params.require(:system_engine).permit(:name, :description, :code , :status)
    end

    def set_engine
      @engine = Pivotal::SystemEngine.find(params[:id])
    end

    def set_engines
      @pagy, @engines = pagy(Pivotal::SystemEngine.all.order(:name))
    end
  end
end