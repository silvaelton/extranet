require_dependency 'attendance/application_controller'

module Attendance
  class CategoriesController < ApplicationController
    before_action :set_categories
    before_action :set_category, only: %i[edit update destroy]

    has_scope :by_name
    has_scope :by_status
    
    def index; end

    def new
      @category = Attendance::Category.new
    end

    def create
      @category = Attendance::Category.new(set_params)
      @category.save
    end

    def edit; end

    def update
      @category.update(set_params)
      @category.save
    end

    def destroy
      @category.destroy
    end

    private

    def set_params
      params.require(:category).permit(:name, :status)
    end

    def set_categories
      @pagy, @categories = pagy(apply_scopes(Attendance::Category).all.order(:name))
    end

    def set_category
      @category = Attendance::Category.find(params[:id])
    end

  end
end