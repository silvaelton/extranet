require_dependency 'support/brb/category'

module Brb
  class Category < Support::Brb::Category
    validates :name, :invoice_type_id, presence: true


    scope :by_name,       ->(name) { where("name ilike '%#{name}%'") }
    scope :by_status,      ->(status) { where(status: status) }
  end
end
