require_dependency 'attendance/application_controller'

module Attendance
  class RequerimentCategoriesController < ApplicationController
    before_action :set_requeriment_categorys
    before_action :set_requeriment_category, only: %i[edit update destroy]
    
    has_scope :by_name
    has_scope :by_status

    def index; end

    def new
      @requeriment_category = Attendance::RequerimentCategory.new
    end

    def create
      @requeriment_category = Attendance::RequerimentCategory.new(set_params)
      @requeriment_category.save
    end

    def edit; end

    def update
      @requeriment_category.update(set_params)
      @requeriment_category.save
    end

    def destroy
      @requeriment_category.destroy
    end

    private

    def set_params
      params.require(:requeriment_category).permit(:name, :status, :description, :outside_cadastre, :program, :program_id)
    end

    def set_requeriment_categorys
      @pagy, @requeriment_categories = pagy(apply_scopes(Attendance::RequerimentCategory).all.order(:name))
    end

    def set_requeriment_category
      @requeriment_category = Attendance::RequerimentCategory.find(params[:id])
    end

  end
end