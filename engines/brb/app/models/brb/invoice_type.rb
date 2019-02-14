require_dependency 'support/brb/invoice_type'

module Brb
  class InvoiceType < Support::Brb::InvoiceType
    validates :name, :account, presence: true

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_account,    ->(account) { where("account ilike '%#{account}%'" ) }
    scope :by_status,      ->(status) { where(status: status) }

  end
end
