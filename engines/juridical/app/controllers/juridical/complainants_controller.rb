require_dependency 'juridical/application_controller'

module Juridical
  class ComplainantsController < ApplicationController
    before_action :set_legal_advice
    before_action :set_complainants, only: [:index, :create, :destroy, :update]
    before_action :set_complainant, only: [:edit, :destroy, :update]

    def index; end

    def new
      @complainant = @legal_advice.complainants.new
    end

    def create
      @complainant = @legal_advice.complainants.new(complainant_params)
      @complainant.staff_id = current_user.id
      @complainant.save
      @legal_advices = Juridical::LegalAdvice.order(created_at: :desc).includes([:lawsuit, :complements]).paginate(:page => params[:page], :per_page => 20)
    end

    def edit; end

    def update
      @complainant.update(complainant_params)
    end

    def destroy
      @complainant.destroy
    end

    private

    def complainant_params
      params.require(:complainant).permit(:name)
    end

    def set_complainants
      @complainants = @legal_advice.complainants.all
    end

    def set_legal_advice
      @legal_advice = Juridical::LegalAdvice.find(params[:legal_advice_id])
    end

    def set_complainant
      @complainant = Juridical::Complainant.find(params[:id])
    end
  end
end
