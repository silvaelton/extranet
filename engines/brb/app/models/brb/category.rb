require_dependency 'support/brb/category'

module Brb
  class Category < Support::Brb::Category
    validates :name, :invoice_type_id, presence: true
  end
end
