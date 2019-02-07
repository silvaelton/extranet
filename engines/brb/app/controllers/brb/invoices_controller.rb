require_dependency 'brb/application_controller'

require 'barby'
require 'barby/barcode/code_128'
require 'barby/barcode/code_25_interleaved'
require 'barby/outputter/png_outputter'

module Brb
  class InvoicesController < ApplicationController
    before_action :set_invoices

    has_scope :by_name
    has_scope :by_cpf
    has_scope :by_id
    has_scope :by_type
    has_scope :by_status
    has_scope :by_date_start
    has_scope :by_date_end
    has_scope :by_category

    def index
      respond_to do |format|
        format.csv {
          if !params[:by_category].present?
            params[:by_category] = 12
          end

          @invoices = apply_scopes(Brb::Invoice).all.order('created_at DESC').all
          @pagy, @tickets = pagy(Brb::Invoice.all)
        }
        format.html
      end
    end

    def new
      @invoice = Brb::Invoice.new
    end

    def create
      @invoice = Brb::Invoice.new(set_params)
      @invoice.save
    end

    def edit
      @invoice = Brb::Invoice.find(params[:id])
    end

    def update
      @invoice = Brb::Invoice.find(params[:id])
      if @invoice.update(set_update_params)
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def show
      @invoice = Brb::InvoiceInvoice.find(params[:id])

      if @invoice.guia_simples?
        barcode = Barby::Code25Interleaved.new(@invoice.barcode)
        File.open("public/uploads/barcodes/#{barcode}.png", 'wb') { |f| f.write barcode.to_png(xdim: 1,height: 50) }
        render template: 'brb/invoices/simple_show', layout: 'brb/invoice'
      else

        @account = '0158567'

        barcode = Barby::Code128.new(@invoice.barcode)
        File.open("public/uploads/barcodes/#{barcode}.png", 'wb') { |f| f.write barcode.to_png(xdim: 1,height: 50) }
        render layout: 'brb/invoice'
      end
    end

    private

    def set_params
      params.require(:invoice).permit(:category_id, :due, :cpf, :name, :address,
                                      :city, :state_id, :value,:cep, :message, :invoice_type_id, :cnpj)
    end

    def set_update_params
      params.require(:invoice).permit(:category_id, :due, :cpf, :name, :address, :value,
                                      :city, :state_id, :cep, :message, :bank_return, :payment, :status, :invoice_focus, :cnpj)
    end

    def set_invoices
      @invoices = apply_scopes(Brb::Invoice).all.order('created_at DESC')
      # @invoices = @invoices.paginate(:page => params[:page], :per_page => 40)
    end
  end
end
