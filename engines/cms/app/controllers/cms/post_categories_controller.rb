require_dependency "cms/application_controller"

module Cms
  class PostCategoriesController < ApplicationController
    before_action :set_post_categories
    before_action :set_post_category, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_status

    def index;end

    def show; end

    def new
      @post_category = Cms::PostCategory.new
    end

    def create
      @post_category = Cms::PostCategory.new(set_params)
      @post_category.save
    end

    def edit; end

    def update
      @post_category.update(set_params)
    end

    def destroy
      @post_category.destroy
    end

    private

    def set_params
      params.require(:post_category).permit(:name, :status, :category_type_id)
    end

    def set_post_categories
      @pagy, @post_categories = pagy(apply_scopes(Cms::PostCategory).all)
    end

    def set_post_category
      @post_category = Cms::PostCategory.find(params[:id])
    end

  end
end