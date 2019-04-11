require_dependency 'pivotal/application_controller'

module Pivotal
  class NavsController < ApplicationController
    before_action :set_navs
    before_action :set_nav, only: [:edit, :update, :destroy]

    
    def index
    end
    
    def new
      @nav = Pivotal::Nav.new
      @nav.father_id = params[:father_id]
    end
    
    def create
      @nav = Pivotal::Nav.new(set_params)
      @nav.save
    end

    def edit;end
    
    def update
      @nav.update(set_params)
    end

    def destroy
      @nav.destroy
    end

    private

    def set_params
      params.require(:nav).permit(:label, :description, :father_id, :status, :url, :position)
    end

    def set_nav
      @nav = Pivotal::Nav.find(params[:id])
    end

    def set_navs
      @navs = Pivotal::Nav.where(father_id: nil).order(:position)
    end
  end
end