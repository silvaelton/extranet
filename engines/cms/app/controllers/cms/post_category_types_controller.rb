require_dependency "cms/application_controller"

module Cms
  class PostCategoryTypesController < ApplicationController
    before_action :set_post_category_types
    before_action :set_post_category_type, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_status

    def index;end

    def show; end

    def new
      @post_category_type = Cms::PostCategoryType.new
    end

    def create
      @post_category_type = Cms::PostCategoryType.new(set_params)
      @post_category_type.save
    end

    def edit; end

    def update
      @post_category_type.update(set_params)
    end

    def destroy
      @post_category_type.destroy
    end

    private

    def set_params
      params.require(:post_category_type).permit(:name, :status)
    end

    def set_post_category_types
      @pagy, @post_category_types = pagy(apply_scopes(Cms::PostCategoryType).all)
    end

    def set_post_category_type
      @post_category_type = Cms::PostCategoryType.find(params[:id])
    end

  end
end