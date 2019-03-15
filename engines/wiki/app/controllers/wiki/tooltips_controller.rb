require_dependency "wiki/application_controller"

module Wiki
  class TooltipsController < ApplicationController
    before_action :set_tooltips
    before_action :set_tooltip, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @tooltip = Wiki::Tooltip.new
    end

    def create
      @tooltip = Wiki::Tooltip.new(set_params)
      @tooltip.user_id = current_user.id
      @tooltip.save
    end

    def edit; end

    def update
      @tooltip.update(set_params)
    end

    def destroy
      @tooltip.destroy
    end

    private

    def set_params
      params.require(:tooltip).permit(:code, :title, :content, :status, :user_id, :category_id)
    end

    def set_tooltips
      @pagy, @tooltips = pagy(apply_scopes(Wiki::Tooltip).all)
    end

    def set_tooltip
      @tooltip = Wiki::Tooltip.find(params[:id])
    end

  end
end