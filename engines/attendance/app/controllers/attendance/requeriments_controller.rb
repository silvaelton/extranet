require_dependency 'attendance/application_controller'

module Attendance
  class RequerimentsController < ApplicationController

    def index  
      @pagy, @requeriments = pagy(apply_scopes(Attendance::Requeriment).all)
    end

    def show
      @requeriment = Attendance::Requeriment.find(params[:id])
    end

  end
end