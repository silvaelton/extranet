require_dependency 'brb/application_controller'

module Brb
	class InvoiceTypesController < ApplicationController
		before_action :set_invoice_types
		before_action :set_invoice_type, only: %i[edit update destroy]

		has_scope :by_name
    has_scope :by_account
		has_scope :by_status
		
		def index; end

		def new
			@invoice_type = Brb::InvoiceType.new
		end

		def create
			@invoice_type = Brb::InvoiceType.new(set_params)
			@invoice_type.save
		end

		def edit; end

		def update
			@invoice_type.update(set_params)
			@invoice_type.save
		end

		def destroy
			@invoice_type.destroy
		end

		private

		def set_params
			params.require(:invoice_type).permit(:name, :status, :account)
		end

		def set_invoice_types
      @pagy, @invoice_types = pagy(apply_scopes(Brb::InvoiceType).all.order(:name))
		end

		def set_invoice_type
			@invoice_type = Brb::InvoiceType.find(params[:id])
		end

	end
end