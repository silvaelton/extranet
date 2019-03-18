require_dependency "attendance/application_controller"

module Attendance
  class AgendaReferencesController < ApplicationController
    before_action :set_agenda_reference_category
    before_action :set_agenda_references
    before_action :set_agenda_reference, only: [:edit, :show, :update, :destroy]
    
    has_scope :by_cpf
    
    def index;end

    def show; end

    def new
      @agenda_reference = @reference_category.agenda_references.new
    end

    def create
      @agenda_reference = @reference_category.agenda_references.new(set_params)
      @agenda_reference.save
    end

    def edit; end

    def update
      @agenda_reference.update(set_params)
    end

    def destroy
      @agenda_reference.destroy
    end

    private

    def set_params
      params.require(:agenda_reference).permit(:cpf, :cnpj, :code)
    end

    def set_agenda_references
      @pagy, @agenda_references = pagy(apply_scopes(Attendance::AgendaReference).all)
    end

    def set_agenda_reference
      @agenda_reference = @reference_category.agenda_references.find(params[:id])
    end

    def set_agenda_reference_category
      @reference_category = Attendance::AgendaReferenceCategory.find(params[:agenda_reference_category_id])
    end

  end
end