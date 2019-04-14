require_dependency 'support/address/unit'

module Address
  class Unit < Support::Address::Unit
    attr_accessor :enterprise_id
    belongs_to :city, required: false, class_name: 'Support::Common::City'

    has_many

    scope :by_city,  ->(city) { where(city_id: city) }
    scope :by_burgh, ->(burgh) { where(burgh: burgh) }
    scope :by_group, ->(group) { where(group: group) }
    scope :by_block, ->(block) { where(block: block) }
    scope :by_unit,  ->(unit)    { where(unit: unit) }

    scope :by_situation, ->(situation) {
      where(id: Support::Address::UnitSituation.select(:unit_id).where(created_at: Support::Address::UnitSituation
                                            .select("MAX(created_at)")
                                            .group(:unit_id), situation_type_id: situation))

     }

    scope :by_registry, -> (registry) {
      where(id: Support::Address::UnitRegistry.select(:unit_id).where(created_at: Support::Address::UnitRegistry
                                            .select("MAX(created_at)")
                                            .group(:unit_id), registry_type_id: registry))

     }
  end
end
