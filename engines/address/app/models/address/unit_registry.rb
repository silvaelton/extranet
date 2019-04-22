require_dependency 'support/address/unit_registry'

module Address
  class UnitRegistry < Support::Address::UnitRegistry
    belongs_to :registry_type, class_name: 'Address::RegistryType'
    
    validates :registry_type_id, presence: true
  end
end
