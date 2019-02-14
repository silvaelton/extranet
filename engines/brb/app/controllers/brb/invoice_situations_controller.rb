require_dependency 'brb/application_controller'

module Brb
	class InvoiceSituationsController < ApplicationController
		before_action :set_invoice_situations
		before_action :set_invoice_situation, only: %i[edit update destroy]

		has_scope :by_name
		has_scope :by_status

		def index; end

		def new
			@invoice_situation = Brb::InvoiceSituation.new
		end

		def create
			@invoice_situation = Brb::InvoiceSituation.new(set_params)
			@invoice_situation.save
		end

		def edit; end

		def update
			@invoice_situation.update(set_params)
			@invoice_situation.save
		end

		def destroy
			@invoice_situation.destroy
		end

		private

		def set_params
			params.require(:invoice_situation).permit(:name, :status)
		end

		def set_invoice_situations
			@pagy, @invoice_situations = pagy(apply_scopes(Brb::InvoiceSituation).all.order(:name))

		end

		def set_invoice_situation
			@invoice_situation = Brb::InvoiceSituation.find(params[:id])
		end

	end
end