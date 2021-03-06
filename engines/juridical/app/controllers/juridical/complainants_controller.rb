require_dependency 'juridical/application_controller'

module Juridical
  class ComplainantsController < ApplicationController
    before_action :set_legal_advice
    before_action :set_complainant, only: [:edit, :destroy, :update]

    def new
      @complainant = @legal_advice.complainants.new
    end

    def create
      @complainant = @legal_advice.complainants.new(complainant_params)
      @complainant.user_id = current_user.id
      @complainant.save
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

    def set_legal_advice
      @legal_advice = Juridical::LegalAdvice.find(params[:legal_advice_id])
    end

    def set_complainant
      @complainant = Juridical::Complainant.find(params[:id])
    end
  end
end
