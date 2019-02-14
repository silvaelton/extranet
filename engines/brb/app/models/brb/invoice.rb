require_dependency 'support/brb/invoice'

module Brb
  class Invoice < Support::Brb::Invoice
    belongs_to :category,     required: false
    belongs_to :invoice_type, required: false, class_name: 'Brb::InvoiceType'
    belongs_to :situation, required: false, class_name: 'Brb::InvoiceSituation'

    validates :due, :category_id, :name, :value, presence: true
    validates :cpf, cpf: true, if: -> {cpf.present?}
    #validates :cep, :city, presence: true, if: -> {self.boleto?}
    validates :cnpj, cnpj: true, if: -> {cnpj.present?}

    after_create :generate_invoice!, if: -> { self.invoice_type.id == 2 }
    after_create :generate_simple_invoice!, if: -> { self.invoice_type.id == 1 }

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_cpf,        ->(cpf) { where(cpf: cpf.gsub('.','').gsub('-','')) }
    scope :by_id,         ->(id) { where(id: id) }
    scope :by_type,       ->(type) { where(invoice_type_id: type) }
    scope :by_status,     ->(status) { where(status: status) }
    scope :by_category,   ->(category) { where(category_id: category) }
    scope :by_date_start, ->(date_start) { where("brb_invoices.created_at::date >= ?", Date.parse(date_start)) }
    scope :by_date_end,   ->(date_end) { where("brb_invoices.created_at::date <= ?", Date.parse(date_end)) }

    private

    def generate_simple_invoice!
      barcode = Brb::CreatingSimpleBarcodeService.new({
        due: self.due.strftime("%d/%m/%Y"),
        value: self.value,
        sequential: self.id
      })

      self.update({
        barcode: barcode.barcode_without_format,
        value: self.value,
        number_our: barcode.sequential,
        number_document: barcode.sequential
      })
    end

    def generate_invoice!

      barcode = Brb::CreatingBarcodeService.new({
        due: self.due.strftime("%d/%m/%Y"),
        value: (self.category.default_value.to_i == 0) ? self.value : self.category.default_value,
        sequential: self.id,
        bank_wallet: 1,
        bank_agency: 208,
        bank_account: self.invoice_type.account
        #bank_account: '0294797'
      })
=begin
      @bank_wallet  = options[:bank_wallet]     ||= '1'
      @sequential   = options[:sequential]      ||= '1'
      @bank         = options[:bank]            ||= '070'
      @bank_agency  = options[:bank_agency]     ||= '058'
      @bank_account = options[:bank_account]    ||= '6002006'

      @due          = options[:due]             ||= '0'
      @coin         = options[:coin]            ||= '9'
      @value        = options[:value]           ||= 100
=end
      self.update({
        barcode: barcode.barcode_with_digit,
        value: (self.category.default_value.to_i == 0) ? self.value.to_f : self.category.default_value,
        number_our: barcode.our_number_with_digits,
        number_document: barcode.sequential
      })
    end
  end
end
