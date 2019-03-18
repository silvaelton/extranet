require_dependency "attendance/application_controller"

module Attendance
  class AgendaSituationsController < ApplicationController
    before_action :set_agenda_situations
    before_action :set_agenda_situation, only: [:edit, :show, :update, :destroy]
    
    def index;end

    def show; end

    def new
      @agenda_situation = Attendance::AgendaSituation.new
    end

    def create
      @agenda_situation = Attendance::AgendaSituation.new(set_params)
      @agenda_situation.save
    end

    def edit; end

    def update
      @agenda_situation.update(set_params)
    end

    def destroy
      @agenda_situation.destroy
    end

    private

    def set_params
      params.require(:agenda_situation).permit()
    end

    def set_agenda_situations
      @pagy, @agenda_situations = pagy(apply_scopes(Attendance::AgendaSituation).all)
    end

    def set_agenda_situation
      @agenda_situation = Attendance::AgendaSituation.find(params[:id])
    end

  end
end