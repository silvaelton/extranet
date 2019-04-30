require_dependency 'attendance/application_controller'

module Attendance
  class RequerimentsController < ApplicationController
    before_action :set_requeriments

    has_scope :by_cpf
    has_scope :by_situation
    has_scope :by_category

    def index  
    end

    def show
      @requeriment = Attendance::Requeriment.find(params[:id])
      @cadastre_requeriments = Attendance::Requeriment.where(cpf: @requeriment.cpf).where.not(id: @requeriment.id)
    end
    
    def update
      @requeriment = Attendance::Requeriment.find(params[:id])
      @requeriment.attendant_answer = true
      @requeriment.attendant_answer_at = Time.now
      @requeriment.attendant_id = current_user.id
      @requeriment.update(set_params)
    end

    private

    def set_params
      params.require(:requeriment).permit(:attendant_answer_content)
    end

    def set_requeriments
      @requeriments_all    = apply_scopes(Attendance::Requeriment).all
      @pagy, @requeriments = pagy(@requeriments_all)
    
    end
  end
end