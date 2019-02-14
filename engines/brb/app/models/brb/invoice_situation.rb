require_dependency 'support/brb/invoice_type'

module Brb
  class InvoiceSituation < Support::Brb::InvoiceSituation
    validates :name, presence: true


    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,      ->(status) { where(status: status) }

  end
end
