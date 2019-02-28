require_dependency 'support/address/unit_cadastre_situation'

module Address
  class UnitCadastreSituation < Support::Address::UnitCadastreSituation
    validates :name, uniqueness: true, presence: true
  end
end
