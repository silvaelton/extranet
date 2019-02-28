require_dependency 'support/address/registry_type'

module Address
  class RegistryType < Support::Address::RegistryType
    validates :name, uniqueness: true, presence: true
  end
end
