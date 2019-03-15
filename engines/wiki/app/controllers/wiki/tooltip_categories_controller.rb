require_dependency "wiki/application_controller"

module Wiki
  class TooltipCategoriesController < ApplicationController
    before_action :set_tooltip_categories
    before_action :set_tooltip_category, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @tooltip_category = Wiki::TooltipCategory.new
    end

    def create
      @tooltip_category = Wiki::TooltipCategory.new(set_params)
      @tooltip_category.save
    end

    def edit; end

    def update
      @tooltip_category.update(set_params)
    end

    def destroy
      @tooltip_category.destroy
    end

    private

    def set_params
      params.require(:tooltip_category).permit(:name, :description, :status)
    end

    def set_tooltip_categories
      @pagy, @tooltip_categories = pagy(apply_scopes(Wiki::TooltipCategory).all)
    end

    def set_tooltip_category
      @tooltip_category = Wiki::TooltipCategory.find(params[:id])
    end

  end
end