require_dependency 'support/address/unit'

module Address
  class Unit < Support::Address::Unit
    belongs_to :city, required: false, class_name: 'Support::Common::City'
  end
end
