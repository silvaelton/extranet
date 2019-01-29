require_dependency 'support/brb/invoice_type'

module Brb
  class InvoiceType < Support::Brb::InvoiceType
    validates :name, :account, presence: true

  end
end
