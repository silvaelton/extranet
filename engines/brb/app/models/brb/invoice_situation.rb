require_dependency 'support/brb/invoice_type'

module Brb
  class InvoiceSituation < Support::Brb::InvoiceSituation
    validates :name, presence: true

  end
end
