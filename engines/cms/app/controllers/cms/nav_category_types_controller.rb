require_dependency "cms/application_controller"

module Cms
  class NavCategoryTypesController < ApplicationController
    before_action :set_nav_category_types
    before_action :set_nav_category_type, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_status

    def index;end

    def show; end

    def new
      @nav_category_type = Cms::NavCategoryType.new
    end

    def create
      @nav_category_type = Cms::NavCategoryType.new(set_params)
      @nav_category_type.save
    end

    def edit; end

    def update
      @nav_category_type.update(set_params)
    end

    def destroy
      @nav_category_type.destroy
    end

    private

    def set_params
      params.require(:nav_category_type).permit(:name, :status)
    end

    def set_nav_category_types
      @pagy, @nav_category_types = pagy(apply_scopes(Cms::NavCategoryType).all.order(:name))
    end

    def set_nav_category_type
      @nav_category_type = Cms::NavCategoryType.find(params[:id])
    end

  end
end