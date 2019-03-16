require_dependency 'attendance/application_controller'

module Attendance
  class EventualCadastresController < ApplicationController

    def index
    end

    def show;end

    def new
      @eventual = Attendance::EventualCadastre.new
    end
    
    def create
      @eventual = Attendance::EventualCadastre.new(set_params)
      @eventual.save
    end

    def edit;end

    def update
      @eventual.update(set_params)
    end

    def destroy
      @eventual.destroy
    end

    private

    def set_params
      params.require(:eventual_cadastre)
        .permit(:name, :cpf, :gender_id, :convocation_id, :program_id, :observation, :born)
    end

    def set_eventual
      @eventual = Attendance::EventualCadastre.find(params[:id])
    end

  end
end