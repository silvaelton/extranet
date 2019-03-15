require_dependency "cms/application_controller"

module Cms
  class NavCategoriesController < ApplicationController
    before_action :set_nav_categories
    before_action :set_nav_category, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_status

    def index;end

    def show; end

    def new
      @nav_category = Cms::NavCategory.new
    end

    def create
      @nav_category = Cms::NavCategory.new(set_params)
      @nav_category.save
    end

    def edit; end

    def update
      @nav_category.update(set_params)
    end

    def destroy
      @nav_category.destroy
    end

    private

    def set_params
      params.require(:nav_category).permit(:name, :status, :category_type_id)
    end

    def set_nav_categories
      @pagy, @nav_categories = pagy(apply_scopes(Cms::NavCategory).all)
    end

    def set_nav_category
      @nav_category = Cms::NavCategory.find(params[:id])
    end

  end
end