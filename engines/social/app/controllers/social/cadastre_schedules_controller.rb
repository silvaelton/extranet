require_dependency 'social/application_controller'

module Social
  class CadastreSchedulesController < ApplicationController
    before_action :set_cadastre
    before_action :set_cadastre_schedule, only: %i[edit update destroy show]

    def new
      @cadastre_schedule = @cadastre.cadastre_schedules.new
    end

    def create
      @cadastre_schedule = @cadastre.cadastre_schedules.new(set_params)
      @cadastre_schedule.save
    end

    def edit; end

    def update
      @cadastre_schedule.update(set_params)
    end

    def destroy
      @cadastre_schedule.destroy
    end

    def show; end

    private

    def set_params
      params.require(:cadastre_schedule).permit(:date, :hour, :observation, :situation_id)
    end

    def set_cadastre_schedule
      @cadastre_schedule = Social::CadastreSchedule.find(params[:id])
    end

    def set_cadastre
      @cadastre = Social::Cadastre.find(params[:cadastre_id])
    end
  end
end
