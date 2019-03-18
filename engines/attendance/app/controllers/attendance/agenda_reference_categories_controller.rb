require_dependency "attendance/application_controller"

module Attendance
  class AgendaReferenceCategoriesController < ApplicationController
    before_action :set_agenda_reference_categories
    before_action :set_agenda_reference_category, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @agenda_reference_category = Attendance::AgendaReferenceCategory.new
    end

    def create
      @agenda_reference_category = Attendance::AgendaReferenceCategory.new(set_params)
      @agenda_reference_category.save
    end

    def edit; end

    def update
      @agenda_reference_category.update(set_params)
    end

    def destroy
      @agenda_reference_category.destroy
    end

    private

    def set_params
      params.require(:agenda_reference_category).permit(:name, :description, :status)
    end

    def set_agenda_reference_categories
      @pagy, @agenda_reference_categories = pagy(apply_scopes(Attendance::AgendaReferenceCategory).all.order(id: :desc))
    end

    def set_agenda_reference_category
      @agenda_reference_category = Attendance::AgendaReferenceCategory.find(params[:id])
    end

  end
end