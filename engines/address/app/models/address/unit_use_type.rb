require_dependency 'support/address/unit_use_type'

module Address
  class UnitUseType < Support::Address::UnitUseType
    validates :name, uniqueness: true, presence: true
  end
end
