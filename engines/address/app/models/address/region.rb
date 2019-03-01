require_dependency 'support/address/region'

module Address
  class Region < Support::Address::Region
    validates :name, uniqueness: true, presence: true
  end
end
