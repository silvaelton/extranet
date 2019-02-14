require_dependency 'juridical/application_controller'

module Juridical
  class DefendantsController < ApplicationController
    before_action :set_legal_advice
    before_action :set_defendants, only: [:index, :create, :destroy, :update]
    before_action :set_defendant, only: [:edit, :destroy, :update]

    def index; end

    def new
      @defendant = @legal_advice.defendants.new
    end

    def create
      @defendant = @legal_advice.defendants.new(defendant_params)
      @defendant.staff_id = current_user.id
      @defendant.save
      @legal_advices = Juridical::LegalAdvice.order(created_at: :desc).includes([:lawsuit, :complements]).paginate(:page => params[:page], :per_page => 20)
    end

    def edit; end

    def update
      @defendant.update(defendant_params)
    end

    def destroy
      @defendant.destroy
    end

    private

    def defendant_params
      params.require(:defendant).permit(:name)
    end

    def set_defendants
      @defendants = @legal_advice.defendants.all
    end

    def set_defendant
      @defendant = Juridical::Defendant.find(params[:id])
    end

    def set_legal_advice
      @legal_advice = Juridical::LegalAdvice.find(params[:legal_advice_id])
    end
  end
end
