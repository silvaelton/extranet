require_dependency "attendance/application_controller"

module Attendance
  class AgendaCategoriesController < ApplicationController
    before_action :set_agenda_categories
    before_action :set_agenda_category, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @agenda_category = Attendance::AgendaCategory.new
    end

    def create
      @agenda_category = Attendance::AgendaCategory.new(set_params)
      @agenda_category.save
    end

    def edit; end

    def update
      @agenda_category.update(set_params)
    end

    def destroy
      @agenda_category.destroy
    end

    private

    def set_params
      params.require(:agenda_category).permit(:name, :status)
    end

    def set_agenda_categories
      @pagy, @agenda_categories = pagy(apply_scopes(Attendance::AgendaCategory).all)
    end

    def set_agenda_category
      @agenda_category = Attendance::AgendaCategory.find(params[:id])
    end

  end
end