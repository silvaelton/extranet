require_dependency 'brb/application_controller'

module Brb
  class RemittancesController < ApplicationController

    def index
      @remittance = Brb::Remittance.new
      @remittance.generate(params[:date], params[:between], params[:end_date])

      render layout: 'brb/invoice'
    end

    def show
      @remittance = Brb::Remittance.find(params[:id])
      render layout: 'brb/invoice'
    end

    def new
    end
  end
end
