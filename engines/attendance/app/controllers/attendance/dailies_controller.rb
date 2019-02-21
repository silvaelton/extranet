require_dependency 'attendance/application_controller'

module Attendance
  class DailiesController < ApplicationController
    before_action :set_dailies
    before_action :set_daily, only: %i[edit update destroy]

    has_scope :by_name
    has_scope :by_cpf
    has_scope :by_attendant
    has_scope :by_station
    has_scope :by_category
    
    def index; end

    def new
      @daily = Attendance::Daily.new
    end

    def create
      @daily = Attendance::Daily.new(set_params)
      @daily.attendant_id = current_attendant  
      @daily.save
    end

    def edit; end

    def update
      @daily.update(set_params)
      @daily.save
    end

    def destroy
      @daily.destroy
    end

    private

    def set_params
      params.require(:daily).permit(:station_id, :attendant_id, :name, :cpf, :document_number,
                                    :scheduled, :category_id, :daily_type_id, :preferential,
                                    :preferential_type_id, :special_condition, :special_condition_id)
    end

    def set_dailies
      @pagy, @dailies = pagy(apply_scopes(Attendance::Daily).all.order(:name))
    end

    def set_daily
      @daily = Attendance::Daily.find(params[:id])
    end

  end
end