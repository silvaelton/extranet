require_dependency 'support/brb/category'

module Brb
  class Category < Support::Brb::Category
    validates :name, :invoice_type_id, presence: true

    belongs_to :invoice_type, required: false, class_name: 'Brb::InvoiceType'

    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,      ->(status) { where(status: status) }

    def presenter
      presenter = call_presenter('Brb::CategoryPresenter', self)
      block_given? ? yield(presenter) : presenter
    end
  end
end
