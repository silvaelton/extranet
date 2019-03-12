require_dependency "cms/application_controller"

module Cms
  class NavsController < ApplicationController
    before_action :set_navs
    before_action :set_nav, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_name
    has_scope :by_publish

    def index;end

    def show; end

    def new
      @nav = Cms::Nav.new
    end

    def create
      @nav = Cms::Nav.new(set_params)
      @nav.user_id = current_user.id
      @nav.save
    end

    def edit; end

    def update
      @nav.update(set_params)
    end

    def destroy
      @nav.destroy
    end

    private

    def set_params
      params.require(:nav).permit(:name, :url, :category_id, :order, :user_id, :publish, :target_blank)
    end

    def set_navs
      @pagy, @navs = pagy(apply_scopes(Cms::Nav).all)
    end

    def set_nav
      @nav = Cms::Nav.find(params[:id])
    end

  end
end