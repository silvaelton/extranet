require_dependency 'support/address/unit_situation_type'

module Address
  class UnitSituationType < Support::Address::UnitSituationType
    validates :name, uniqueness: true, presence: true
  end
end
